module Simplabs

  module Highlight

    module ViewMethods

      def highlight(language, text = nil, &block)
        raise HighlightException.new('Specifiy either a text or a block but not both!') if text && block_given?
        text ||= yield
        return text unless Simplabs::Highlight.initialized
        Simplabs::Highlight::PygmentsWrapper.highlight(text, language)
      end

    end

  end

end
