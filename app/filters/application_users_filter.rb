class ApplicationUsersFilter < BaseFilter
  attribute :name, :string
  attribute :company_id, :integer

  def filter
    apply_name_condition if name?
    apply_company_id_condition if company_id?

    super
  end

  private

  def apply_name_condition
    query_builder.where('name ILIKE :name', name: "%#{name}%")
  end

  def apply_company_id_condition
    query_builder.where(company_id: company_id)
  end
end
