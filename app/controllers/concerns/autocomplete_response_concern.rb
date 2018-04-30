module AutocompleteResponseConcern
  private

  def autocomplete_response(collection, text_attribute: :name)
    render json: collection.map { |object| { id: object.id, text: object.send(text_attribute) } }
  end
end
