class OrdersFilter < BaseFilter
  attribute :key, :string
  attribute :description, :string

  attribute :sort, :string, default: 'created_at'
  attribute :order, :string, default: 'desc'

  def filter
    apply_key_condition if key?
    apply_description_condition if description?

    super
  end

  private

  def apply_key_condition
    query_builder.where('key ILIKE :key', key: "%#{key}%")
  end

  def apply_description_condition
    query_builder.where('description ILIKE :description', description: "%#{description}%")
  end
end
