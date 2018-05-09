module Orders
  class PerformanceChartController < ApplicationController
    def index
      @performance_column_chart = PerformanceColumnChart.new(performance_column_chart_attributes)
      @data = @performance_column_chart.data.map(&:attributes)

      @average_times = @data.collect { |e| { e['operation_name'] => e['average_time']&.round(2) } }
      @estimated_times = @data.collect { |e| { e['operation_name'] => e['estimated_time'] } }
      @performance_column_chart_data =
        [
          { name: t('.average_time'), data: @average_times.inject(&:merge) },
          { name: t('.estimated_time'), data: @estimated_times.inject(&:merge) }
        ]

      @completed_amount = @data.collect { |e| e['activities_count'] }.min
      @amount = Order.find_by_id(order_id)&.amount
    end

    private

    def performance_column_chart_attributes
      company_owner_scope(permitted_performance_column_chart_params).symbolize_keys
    end

    def permitted_performance_column_chart_params
      permitted_filter_params(:performance_column_chart, :order_id)
    end

    def order_id
      performance_column_chart_attributes.fetch(:order_id, nil)
    end
  end
end
