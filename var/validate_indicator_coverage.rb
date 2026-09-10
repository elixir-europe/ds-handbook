# frozen_string_literal: true

require "optparse"
require "pathname"
require "set"
require "yaml"

module IndicatorCoverage
  Result = Struct.new(:source_count, :page_count, :errors, keyword_init: true) do
    def success?
      errors.empty?
    end
  end

  class Validator
    def initialize(source_path:, pages_root:)
      @source_path = Pathname(source_path)
      @pages_root = Pathname(pages_root)
    end

    def validate
      errors = []
      source_entries = load_source_entries(errors)
      page_entries = load_page_entries(errors)

      if source_entries && page_entries
        report_duplicates(source_entries, "Source indicator ID", errors)
        report_duplicates(page_entries, "Page ID", errors)

        source_ids = source_entries.map(&:first).to_set
        page_ids = page_entries.map(&:first).to_set

        (source_ids - page_ids).sort.each do |id|
          errors << "Missing handbook page for source indicator #{id.inspect}."
        end

        (page_ids - source_ids).sort.each do |id|
          path = page_entries.find { |page_id, _path| page_id == id }&.last
          errors << "Indicator page #{relative_page_path(path)} uses #{id.inspect}, which is absent from the source model."
        end
      end

      Result.new(
        source_count: source_entries&.map(&:first)&.uniq&.length || 0,
        page_count: page_entries&.map(&:first)&.uniq&.length || 0,
        errors: errors
      )
    end

    private

    def load_source_entries(errors)
      data = YAML.safe_load(@source_path.read(encoding: "UTF-8"), aliases: true)
      indicators = data.is_a?(Hash) ? data["indicators"] : nil
      unless indicators.is_a?(Array)
        errors << "Source model #{@source_path} must contain an indicators list."
        return nil
      end

      indicators.filter_map.with_index do |indicator, index|
        id = indicator.is_a?(Hash) ? normalized_id(indicator["indicatorId"]) : nil
        if id
          [id, "source entry #{index + 1}"]
        else
          errors << "Source indicator at position #{index + 1} has no non-empty indicatorId."
          nil
        end
      end
    rescue Errno::ENOENT
      errors << "Source model not found: #{@source_path}."
      nil
    rescue Psych::SyntaxError => e
      errors << "Source model is not valid YAML: #{e.message.lines.first.strip}"
      nil
    end

    def load_page_entries(errors)
      paths = @pages_root.glob("*/*.md").sort
      if paths.empty?
        errors << "No indicator pages found under #{@pages_root}."
        return nil
      end

      paths.filter_map do |path|
        metadata = parse_frontmatter(path, errors)
        next unless metadata

        id = normalized_id(metadata["page_id"])
        if id
          [id, path]
        else
          errors << "Indicator page #{relative_page_path(path)} has no non-empty page_id."
          nil
        end
      end
    end

    def parse_frontmatter(path, errors)
      lines = path.read(encoding: "UTF-8").sub(/\A\uFEFF/, "").lines
      unless lines.first&.strip == "---"
        errors << "Indicator page #{relative_page_path(path)} has no YAML frontmatter."
        return nil
      end

      closing_index = lines[1..]&.index { |line| line.strip == "---" }
      unless closing_index
        errors << "Indicator page #{relative_page_path(path)} has unclosed YAML frontmatter."
        return nil
      end

      metadata = YAML.safe_load(lines[1, closing_index].join, aliases: true) || {}
      return metadata if metadata.is_a?(Hash)

      errors << "Indicator page #{relative_page_path(path)} frontmatter must be a mapping."
      nil
    rescue Psych::SyntaxError => e
      errors << "Indicator page #{relative_page_path(path)} has invalid YAML: #{e.message.lines.first.strip}"
      nil
    end

    def report_duplicates(entries, label, errors)
      entries.group_by(&:first).sort.each do |id, matches|
        next unless matches.length > 1

        locations = matches.map { |_entry_id, location| relative_page_path(location) }
        errors << "#{label} #{id.inspect} is duplicated in #{locations.join(', ')}."
      end
    end

    def normalized_id(value)
      value.to_s.strip.then { |id| id.empty? ? nil : id }
    end

    def relative_page_path(path)
      return path unless path.is_a?(Pathname)

      path.relative_path_from(@pages_root).to_s
    rescue ArgumentError
      path.to_s
    end
  end
end

if $PROGRAM_NAME == __FILE__
  repository_root = Pathname(__dir__).parent
  options = {
    source_path: repository_root / "_external/rdm-maturity-model/_data/maturity_model.yaml",
    pages_root: repository_root / "pages/maturity-model"
  }

  OptionParser.new do |parser|
    parser.banner = "Usage: ruby var/validate_indicator_coverage.rb [options]"
    parser.on("--source PATH", "Path to maturity_model.yaml") { |path| options[:source_path] = path }
    parser.on("--pages PATH", "Path to the maturity-model pages directory") { |path| options[:pages_root] = path }
  end.parse!

  result = IndicatorCoverage::Validator.new(**options).validate
  if result.success?
    puts "Indicator coverage: #{result.source_count} source indicators; " \
         "#{result.page_count} unique pages; coverage complete."
  else
    warn "Indicator coverage failed with #{result.errors.length} error(s):"
    result.errors.each { |error| warn "  - #{error}" }
    exit 1
  end
end
