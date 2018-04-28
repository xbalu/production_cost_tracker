class QueryBuilder
  def initialize(klass_const)
    @query = klass_const
  end

  def method_missing(method_name, *args)
    if @query.respond_to?(method_name)
      @query = @query.send(method_name, *args)
      self
    else
      raise NoMethodError, "undefined method `#{method_name}`"
    end
  end

  def execute
    @query
  end
end
