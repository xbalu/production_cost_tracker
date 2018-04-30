module AutocompleteHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper

  def autocomplete(attribute, search_path, text_attribute, options = {})
    css_class = [options.delete(:class), 'select2-autocomplete'].compact.join(' ')
    selection = SelectionBuilder.new(self.object, attribute, text_attribute).build
    data = { endpoint: search_path, selection: selection }

    hidden_field attribute, options.merge(class: css_class).merge(data: data)
  end

  private

  class SelectionBuilder
    def initialize(object, attribute, text_attribute)
      @object = object
      @attribute = attribute
      @text_attribute = text_attribute
    end

    def build
      { id: object.send(attribute), text: object.send(association_name).try(text_attribute) }.to_json
    end

    private

    attr_reader :object, :attribute, :text_attribute

    def association_name
      attribute.to_s.titleize.downcase.gsub(' ', '_')
    end
  end
end
