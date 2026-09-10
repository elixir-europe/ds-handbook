# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "tmpdir"
require "yaml"

require_relative "../validate_indicator_coverage"

class ValidateIndicatorCoverageTest < Minitest::Test
  def test_matching_source_and_pages_pass
    result = validate(source_ids: %w[mm-one mm-two], pages: %w[mm-one mm-two])

    assert result.success?
    assert_equal 2, result.source_count
    assert_equal 2, result.page_count
  end

  def test_missing_page_fails
    result = validate(source_ids: %w[mm-one mm-two], pages: %w[mm-one])

    refute result.success?
    assert_includes result.errors, 'Missing handbook page for source indicator "mm-two".'
  end

  def test_duplicate_page_id_fails
    result = validate(
      source_ids: %w[mm-one],
      pages: [
        { file: "first.md", id: "mm-one" },
        { file: "second.md", id: "mm-one" }
      ]
    )

    refute result.success?
    assert result.errors.any? { |error| error.start_with?('Page ID "mm-one" is duplicated') }
  end

  def test_page_absent_from_source_model_fails
    result = validate(source_ids: %w[mm-one], pages: %w[mm-one mm-retired])

    refute result.success?
    assert result.errors.any? { |error| error.include?('uses "mm-retired", which is absent from the source model') }
  end

  def test_page_without_page_id_fails
    result = validate(
      source_ids: %w[mm-one],
      pages: [{ file: "missing-id.md", id: nil }, { file: "one.md", id: "mm-one" }]
    )

    refute result.success?
    assert_includes result.errors, "Indicator page domain/missing-id.md has no non-empty page_id."
  end

  def test_missing_source_does_not_emit_cascading_page_errors
    Dir.mktmpdir("indicator-coverage-test") do |directory|
      pages_root = File.join(directory, "pages", "domain")
      FileUtils.mkdir_p(pages_root)
      File.write(File.join(pages_root, "one.md"), "---\npage_id: mm-one\n---\n")

      result = IndicatorCoverage::Validator.new(
        source_path: File.join(directory, "missing.yaml"),
        pages_root: File.join(directory, "pages")
      ).validate

      refute result.success?
      assert_equal 1, result.errors.length
      assert_match(/Source model not found/, result.errors.first)
    end
  end

  private

  def validate(source_ids:, pages:)
    Dir.mktmpdir("indicator-coverage-test") do |directory|
      root = File.join(directory, "pages")
      domain = File.join(root, "domain")
      FileUtils.mkdir_p(domain)

      source_path = File.join(directory, "maturity_model.yaml")
      File.write(
        source_path,
        { "indicators" => source_ids.map { |id| { "indicatorId" => id } } }.to_yaml
      )

      Array(pages).each_with_index do |page, index|
        attributes = page.is_a?(Hash) ? page : { id: page }
        filename = attributes.fetch(:file, "page-#{index + 1}.md")
        metadata = { "title" => "Test indicator" }
        metadata["page_id"] = attributes[:id] if attributes[:id]
        File.write(File.join(domain, filename), "---\n#{metadata.to_yaml.sub(/\A---\s*\n/, '')}---\n")
      end

      return IndicatorCoverage::Validator.new(
        source_path: source_path,
        pages_root: root
      ).validate
    end
  end
end
