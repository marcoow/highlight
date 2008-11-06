module Simplabs

  module Highlight

    # Defines methods for highlighting source code in templates
    module ViewMethods

      # Highlights +code+ according to the syntax of +language+
      def highlight(language, code)
        return CGI.escapeHTML(code) unless Simplabs::Highlight.initialized
        Simplabs::Highlight::PygmentsWrapper.highlight(code, language)
      end

    end

  end

end
