class BaseFilter < ActiveType::Object
  attribute :company_id, :integer
  attribute :page, :integer, default: 1
  attribute :per_page, :integer, default: ApplicationRecord.per_page
  attribute :sort, :string, default: 'name'
  attribute :order, :string, default: 'asc'

  def filter
    apply_company_id_condition if company_id?

    apply_pagination
    apply_sorting

    query_builder.execute
  end

  private

  def apply_company_id_condition
    query_builder.where(company_id: company_id)
  end

  def apply_pagination
    query_builder.paginate(page: page, per_page: per_page)
  end

  def apply_sorting
    query_builder.order("#{sort} #{order}")
  end

  def query_builder
    @query_builder ||= QueryBuilder.new(klass_const)
  end

  def klass_const
    Module.const_get(self.class.name.sub(/Filter\z/, '').classify)
  end
end
