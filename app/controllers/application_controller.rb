class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :auth_session

  helper_method :current_user
  helper_method :possible_users

  def auth_session
    @current_user = Session.new(session, possible_users).find_user
    redirect_to new_session_path unless @current_user.authenticated?
  end

  def current_user
    @current_user ||= User.new
  end

  def possible_users
    User.all
  end
end
