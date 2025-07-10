class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    redirect_to root_path, alert: "Login required" unless current_user
  end
end
