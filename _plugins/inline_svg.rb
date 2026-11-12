# frozen_string_literal: true

# Inlines an SVG file straight into the page so the site's CSS can reach
# inside it. The landmark icons depend on this: the door and tile hover
# effects animate individual paths (.flame, .arm-1, .arm-2, .flag), which
# is impossible when an SVG is referenced with <img src>.
#
# Usage:  {{ "images/icons/tile-guidance.svg" | inline_svg }}
module Jekyll
  module InlineSvgFilter
    def inline_svg(path)
      return "" if path.nil? || path.to_s.empty?

      site = @context.registers[:site]
      full = File.expand_path(File.join(site.source, path))

      # Keep reads inside the repo.
      unless full.start_with?(File.expand_path(site.source))
        Jekyll.logger.warn "inline_svg:", "refusing path outside the site source: #{path}"
        return ""
      end

      unless File.file?(full)
        Jekyll.logger.warn "inline_svg:", "file not found: #{path}"
        return ""
      end

      File.read(full)
    end
  end
end

Liquid::Template.register_filter(Jekyll::InlineSvgFilter)
