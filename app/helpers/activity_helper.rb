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

    hours = (total_seconds / (60 * 60)).floor
    minutes = ((total_seconds / 60) % 60).floor
    seconds = (total_seconds % 60).floor

    formatted_duration = format('%02d:%02d:%02d', hours, minutes, seconds)
    css_class = total_seconds < (estimated_time * 60) ? 'text-success' : 'text-danger'

    content_tag('span', formatted_duration, class: css_class)
  end
end
