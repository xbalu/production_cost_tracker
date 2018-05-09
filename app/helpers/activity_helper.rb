module ActivityHelper
  def order_tooltip(activity)
    link_to '#', rel: 'tooltip', title: "#{activity.order_key} (#{activity.order_description})" do
      content_tag('span', '', class: 'glyphicon glyphicon-list-alt')
    end
  end

  def application_user_tooltip(name)
    link_to '#', rel: 'tooltip', title: name do
      content_tag('span', '', class: 'glyphicon glyphicon-user')
    end
  end

  def duration(created_at, ended_at, estimated_time)
    return '' if ended_at.nil?

    total_seconds = ended_at - created_at
    estimated_seconds = estimated_time.minutes.to_i

    hours = (total_seconds / (60 * 60)).floor
    minutes = ((total_seconds / 60) % 60).floor
    seconds = (total_seconds % 60).floor

    formatted_duration = format('%02d:%02d:%02d', hours, minutes, seconds)

    content_tag('span', formatted_duration, class: formatted_duration_class(total_seconds, estimated_seconds))
  end

  private

  def formatted_duration_class(total_seconds, estimated_seconds)
    return '' if total_seconds == estimated_seconds

    total_seconds < estimated_seconds ? 'text-success' : 'text-danger'
  end
end
