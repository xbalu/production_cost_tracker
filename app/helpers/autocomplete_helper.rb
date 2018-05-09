module AutocompleteHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper

  def autocomplete(attribute, search_path, text_attributes, options = {})
    css_class = [options.delete(:class), 'select2-autocomplete'].compact.join(' ')
    selection = SelectionBuilder.new(object_or_value(attribute), attribute, text_attributes).build
    data = { endpoint: search_path, selection: selection }

    hidden_field attribute, options.merge(class: css_class).merge(data: data)
  end

  private

  def object_or_value(attribute)
    self.object || @template.controller.params.dig(object_name, attribute)
  end

  class SelectionBuilder
    def initialize(object_or_value, attribute, text_attributes)
      @object_or_value = object_or_value
      @attribute = attribute
      @text_attributes = text_attributes
    end

    def build
      { id: resource_id, text: resource_text }.to_json
    end

    private

    attr_reader :object_or_value, :attribute, :text_attributes

    def resource_id
      object_or_value.respond_to?(attribute) ? object_or_value.send(attribute) : object_or_value
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
