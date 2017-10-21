class SessionController < ApplicationController

  skip_before_action :auth_session, only: [:create, :new]

  attr_reader :resource
  helper_method :resource

  def new
    setup_new_page
  end

  def create
    @resource = Session.new(session, possible_users, session_params)
    if @resource.save
      flash[:success] = "You are now signed in."
      redirect_to root_path
    else
      flash.now[:error] = "Sign in failed."
      setup_new_page
      render :new
    end
  end

  def destroy
    Session.new(session).destroy
    flash[:success] = "You have been signed out."
    redirect_to new_session_path
  end

  def show
    redirect_to new_session_path
  end

  def setup_new_page
    @resource = Session.new(session)
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

end
