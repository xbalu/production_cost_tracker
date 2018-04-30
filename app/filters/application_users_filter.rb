class ApplicationUsersFilter < BaseFilter
  attribute :name, :string

  def filter
    apply_name_condition if name?

    super
  end

  private

  def apply_name_condition
    query_builder.where('name ILIKE :name', name: "%#{name}%")
  end
end
