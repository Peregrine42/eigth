
class UsersController < ApplicationController
  include Resourceful::Controller::NewAction
  include Resourceful::Controller::IndexAction

  extend Foo
  show_resource
  
  attr_reader :resource
  helper_method :resource
  attr_reader :resources
  helper_method :resources

  alias :resource_path :user_path
  helper_method :resource_path
  alias :resources_path :users_path
  helper_method :resources_path
  alias :edit_resource_path :edit_user_path
  helper_method :edit_resource_path
  alias :new_resource_path :new_user_path
  helper_method :new_resource_path

  def resource_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end

  def setup_new_page
  end

  def setup_show_page
  end

  def setup_edit_page
  end

  def resource_class
    User
  end

  CREATE_SUCCESS_MESSAGE = "Success! Resource created."
  CREATE_FAILURE_MESSAGE = "Could not create a new Resource."

  UPDATE_SUCCESS_MESSAGE = "Success! Resource updated."
  UPDATE_FAILURE_MESSAGE = "Could not update the Resource."

  DELETE_SUCCESS_MESSAGE = "Success! Resource deleted."
  DELETE_FAILURE_MESSAGE = "Could not delete the Resource."

  # new_resource
  # create_resource

  # show_resource
  # edit_resource

  # update_resource
  # delete_resource

  # index_resources

end
