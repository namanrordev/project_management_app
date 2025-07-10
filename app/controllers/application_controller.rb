class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  helper_method :current_user
  helper_method :user_can_modify_proposal?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    redirect_to root_path, alert: "Login required" unless current_user
  end

  def user_can_modify_proposal?(proposal)
    return false unless current_user
    return true if proposal.user_id == current_user.id

    proposal.co_authors.where(user_id: current_user.id, status: %w[invited accepted]).exists?
  end
end
