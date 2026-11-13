# Builds the maturity model's indicator pages, and its sidebar, from the model
# itself.
#
# Until model 2.0.0 the 25 indicator pages under pages/maturity-model/ were written
# by hand while the overview table on /maturity-model rendered the same levels from
# maturity_model.json. Nothing compared the two, and nine pages had drifted. The
# model now carries the content the pages used to hold -- the level titles, their
# explanations, the Impact statements and the criteria bullets -- so the pages are
# generated from it and cannot drift again.
#
# The model arrives through the _external/rdm-maturity-model submodule, symlinked
# as _data/shared, so it reads as site.data["shared"]["maturity_model"].
#
# Nothing here is hand-editable: to change what an indicator page says, change the
# model in the rdm-maturity-model repository.
module DSHandbook
  class MaturityModelPages < Jekyll::Generator
    safe true
    priority :high

    SIDEBAR = "maturity-model".freeze

    # The theme's edit, history and report-an-issue buttons link to page.path in this
    # repository by default. A generated page has no file here, so they point to the
    # model instead, which is where its content is edited.
    MODEL_SOURCE = {
      "repository_url" => "https://github.com/elixir-europe/rdm-maturity-model",
      "branch" => "main",
      "file_path" => "_data/maturity_model.json"
    }.freeze

    def generate(site)
      model = site.data.dig("shared", "maturity_model")
      # Without the model, stop instead of empty pages generation
      if model.nil? || model["indicators"].nil?
        Jekyll.logger.abort_with "Maturity model:",
                                 "no model data in _data/shared, so the indicator pages " \
                                 "cannot be generated. Fetch the model with " \
                                 "`git submodule update --init`."
      end

      unless model["indicators"].first["maturityLevels"].first.is_a?(Hash)
        Jekyll.logger.abort_with "Maturity model:",
                                 "the model predates 2.0.0 -- levels are still plain " \
                                 "strings, so the indicator pages cannot be generated. " \
                                 "Update the _external/rdm-maturity-model submodule."
      end

      model["indicators"].each { |indicator| site.pages << page_for(site, indicator) }
      site.data["sidebars"][SIDEBAR] = sidebar_for(model)
      warn_unresolved_contributors(site)

      Jekyll.logger.info "Maturity model:",
                         "generated #{model['indicators'].size} indicator pages from " \
                         "model #{model.dig('version', 'versionNumber')}"
    end

    private

    # The model carries its contributors and their details, synced from this repo's
    # _data/CONTRIBUTORS.yaml. Anyone with no details in either file renders as a
    # bare set of initials, which is easy to miss on the page and easy to fix here.
    def warn_unresolved_contributors(site)
      people = site.data.dig("shared", "contributors")
      return unless people.is_a?(Hash)

      directory = site.data["CONTRIBUTORS"] || {}
      described = lambda do |name, details|
        return true if details.is_a?(Hash) && !details.empty?

        fallback = directory[name]
        fallback.is_a?(Hash) && !fallback.empty?
      end

      unresolved = people.reject { |name, details| described.call(name, details) }.keys
      return if unresolved.empty?

      Jekyll.logger.warn "Maturity model:",
                         "#{unresolved.size} of #{people.size} contributor(s) have no " \
                         "GitHub handle, ORCID or affiliation recorded, and render as " \
                         "initials: #{unresolved.join(', ')}"
    end

    # mm-strategy-defined lives under pages/maturity-model/mm-strategy/, which is
    # also the page_id of that domain's index page.
    def domain_dir(indicator_id)
      indicator_id.split("-").first(2).join("-")
    end

    def page_for(site, indicator)
      id = indicator["indicatorId"]
      dir = File.join("pages", "maturity-model", domain_dir(id))

      page = Jekyll::PageWithoutAFile.new(site, site.source, dir, "#{id}.md")
      page.content = body(indicator)
      page.data.merge!(
        "title" => indicator["indicator"],
        "description" => indicator["indicatorDescription"],
        "page_id" => id,
        "layout" => "page",
        "sidebar" => SIDEBAR,
        "permalink" => "/#{id}",
        "github" => MODEL_SOURCE,
        "generated_from_model" => true
      )
      page
    end

    def body(indicator)
      lines = []

      # Kept where a shortened indicator name would lose its scope (only Ethics and
      # Adherence to policies in 2.0.0). Italic, like a level's brief description.
      if indicator["indicatorBriefDescription"]
        lines << "*#{indicator['indicatorBriefDescription']}*"
        lines << ""
      end

      lines << indicator["indicatorLongDescription"]
      lines << ""

      indicator["maturityLevels"].each do |level|
        lines << "## Level #{level['order']} – #{level['title']}"
        lines << ""

        if level["briefDescription"]
          lines << "*#{level['briefDescription']}*"
          lines << ""
        end

        level.fetch("criteria", []).each { |criterion| lines << "* #{criterion}" }
        lines << "" unless level.fetch("criteria", []).empty?

        if level["impact"]
          lines << "**Impact**: #{level['impact']}"
          lines << ""
        end
      end

      lines << "{% include back-to-mm.html %}"
      lines.join("\n")
    end

    # The sidebar mirrors the model: one entry per domain, one per indicator, in
    # the model's own order.
    def sidebar_for(model)
      domains = model["domains"].sort_by { |domain| domain["domainLevel"].to_i }

      {
        "title" => "Maturity Model",
        "title_url" => "/maturity-model",
        "subitems" => domains.map do |domain|
          indicators = model["indicators"].select { |i| i["domain"] == domain["domainName"] }
          next if indicators.empty?

          {
            "title" => domain["domainName"],
            "url" => "/#{domain_dir(indicators.first['indicatorId'])}",
            "subitems" => indicators.map do |indicator|
              {
                "title" => indicator["indicator"],
                "url" => "/#{indicator['indicatorId']}"
              }
            end
          }
        end.compact
      }
    end
  end
end
