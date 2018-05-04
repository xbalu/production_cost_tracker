module AutocompleteResponseConcern
  private

  def autocomplete_response(collection, text_attributes: [:name])
    render json: begin
      collection.map do |object|
        { id: object.id, text: text_attributes.map { |attribute| object.send(attribute) }.join(' - ') }
      end
    end
  end
end
