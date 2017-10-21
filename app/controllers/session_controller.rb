class SessionController < ApplicationController

  attr_reader :resource
  helper_method :resource

  def new
    @resource = Session.new(session)
  end

end
