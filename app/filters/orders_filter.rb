class OrdersFilter < BaseFilter
  attribute :key, :string
  attribute :description, :string
  attribute :operation_id, :integer

  attribute :sort, :string, default: 'created_at'
  attribute :order, :string, default: 'desc'

  def filter
    apply_key_condition if key?
    apply_description_condition if description?
    apply_operation_id_condition if operation_id?

    apply_distinct

    super
  end

  private

  def apply_key_condition
    query_builder.where('orders.key ILIKE :key', key: "%#{key}%")
  end

  def apply_description_condition
    query_builder.where('orders.description ILIKE :description', description: "%#{description}%")
  end

  def apply_operation_id_condition
    query_builder.where('operations.id = :id', id: operation_id)
  end

  def apply_distinct
    query_builder.distinct
  end

  def query_builder
    @query_builder ||= QueryBuilder.new(klass_const.joins(:operations))
  end
end
