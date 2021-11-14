class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user

  private

  def require_login
    unless logged_in
      flash[:message] = "You must be signed in to view your profile or go on rides"
      redirect_to '/' 
    end
  end

  def logged_in
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
