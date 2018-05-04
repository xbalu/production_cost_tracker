module AutocompleteHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper

  def autocomplete(attribute, search_path, text_attributes, options = {})
    css_class = [options.delete(:class), 'select2-autocomplete'].compact.join(' ')
    selection = SelectionBuilder.new(self.object, attribute, text_attributes).build
    data = { endpoint: search_path, selection: selection }

    hidden_field attribute, options.merge(class: css_class).merge(data: data)
  end

  private

  class SelectionBuilder
    def initialize(object, attribute, text_attributes)
      @object = object
      @attribute = attribute
      @text_attributes = text_attributes
    end

    def build
      { id: resource_id, text: resource_text }.to_json
    end

    private

    attr_reader :object, :attribute, :text_attributes

    def resource_id
      object.send(attribute)
    end

    def resource_text
      text_attributes.map { |attribute| resource.try(attribute) }.compact.join(' - ')
    end

    def resource
      Module.const_get(association_name.classify).find_by(id: resource_id)
    end

    def association_name
      attribute.to_s.titleize.downcase.gsub(' ', '_')
    end
  end
end
