class Orders::PerformanceColumnChart
  attr_reader :company_id, :order_id

  def initialize(company_id: nil, order_id: nil)
    @company_id = company_id
    @order_id = order_id
  end

  def data
    return data_source.none if company_id.blank? || order_id.blank?

    data_source.select(select_attributes.join(', '))
               .where('orders.company_id = :id', id: company_id)
               .where('operations.order_id = :id', id: order_id)
               .group(group_attributes.join(', '))
               .order('operations.created_at')
  end

  private

  def data_source
    Operation.joins(:order).left_outer_joins(:work_on_operations)
  end

  def select_attributes
    [
      "CONCAT_WS(' - ', operations.key, operations.description) AS operation_name",
      'COUNT(work_on_operations.ended_at) AS activities_count',
      'EXTRACT(EPOCH FROM AVG(AGE(work_on_operations.ended_at, work_on_operations.created_at)) / 60) as average_time',
      'operations.estimated_time'
    ]
  end

  def group_attributes
    [
      'operations.key',
      'operations.description',
      'operations.created_at',
      'operations.estimated_time'
    ]
  end
end
