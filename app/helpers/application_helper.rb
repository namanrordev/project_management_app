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

  def user_can_modify_proposal?(proposal)
    return false unless current_user
    return true if proposal.user_id == current_user.id

    proposal.co_authors.where(user_id: current_user.id, status: %w[invited accepted]).exists?
  end
end
