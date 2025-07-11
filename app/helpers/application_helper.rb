module ApplicationHelper
  def bootstrap_class_for_status(status)
    case status
    when "approved"
      "secondary"
    when "in_progress"
      "info"
    when "completed"
      "success"
    else
      "light"
    end
  end
end
