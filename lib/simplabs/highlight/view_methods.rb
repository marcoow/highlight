module Simplabs

  module Highlight

    # Defines methods for highlighting source code in templates
    module ViewMethods

      # Highlights +code+ according to the syntax of +language+. If +code+ is not specified, the method yields to
      # the block. If neither +code+ or a block are specified, a HighlightException is raised.
      def highlight(language, code = nil, &block)
        raise HighlightException.new('Specifiy either a text or a block but not both!') if code && block_given?
        code ||= yield
        return CGI.escapeHTML(code) unless Simplabs::Highlight.initialized
        Simplabs::Highlight::PygmentsWrapper.highlight(code, language)
      end

    end

  end

end
