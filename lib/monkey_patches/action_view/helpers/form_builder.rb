module ActionView
  module Helpers
    class FormBuilder < Object
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormTagHelper

      def error(field, html_options = {})
        return unless @object && @object.errors[field].try(:any?)

        html_options.merge!(class: 'ui error')

        @template.content_tag :div, html_options do
          content_tag :span, @object.errors[field].shift
        end.html_safe
      end
    end
  end
end
