class ApplicationUsersActivitiesFilter < ActiveType::Object
  attribute :company_id, :integer
  attribute :application_user_id, :integer
  attribute :order_id, :integer
  attribute :operation_id, :integer

  attribute :date_from, :date
  attribute :date_to, :date

  attribute :page, :integer, default: 1
  attribute :per_page, :integer, default: 50
  attribute :sort, :string, default: 'work_on_operations.created_at'
  attribute :order, :string, default: 'desc'

  validates :date_from, date: { allow_blank: true }
  validates :date_to, date: { after_or_equal_to: :date_from, allow_blank: true }, if: :date_from?

  def filter
    apply_select_condition

    apply_company_id_condition
    apply_application_user_id_condition if application_user_id?
    apply_order_id_condition if order_id?
    apply_operation_id_condition if operation_id?
    apply_date_from_condition if date_from?
    apply_date_to_condition if date_to?

    apply_pagination
    apply_sorting

    query_builder.execute
  end

  private

  def apply_select_condition
    query_builder.select(select_attributes.join(', '))
  end

  def apply_company_id_condition
    query_builder.where('application_users.company_id = :id', id: company_id)
  end

  def apply_application_user_id_condition
    query_builder.where('work_on_operations.application_user_id = :id', id: application_user_id)
  end

  def apply_order_id_condition
    query_builder.where('operations.order_id = :id', id: order_id)
  end

  def apply_operation_id_condition
    query_builder.where('work_on_operations.operation_id = :id', id: operation_id)
  end

  def apply_date_from_condition
    query_builder.where('work_on_operations.created_at >= :date', date: date_from.to_time)
  end

  def apply_date_to_condition
    query_builder.where('work_on_operations.created_at <= :date', date: date_to.end_of_day)
  end

  def apply_pagination
    query_builder.paginate(page: page, per_page: per_page)
  end

  def apply_sorting
    query_builder.order("#{sort} #{order}")
  end

  def select_attributes
    [
      'orders.key AS order_key',
      'orders.description AS order_description',
      'application_users.name AS application_user_name',
      'operations.key AS operation_key',
      'operations.description AS operation_description',
      'operations.estimated_time AS operation_estimated_time',
      'work_on_operations.created_at',
      'work_on_operations.ended_at'
    ]
  end

  def query_builder
    @query_builder ||= QueryBuilder.new WorkOnOperation.joins(:operation)
                                                       .joins(:application_user)
                                                       .joins('INNER JOIN orders ON orders.id = operations.order_id')
  end
end
