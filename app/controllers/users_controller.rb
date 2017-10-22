class UsersController < ApplicationController
  include ResourcefulConstants
  include ResourcefulBasicSetup
  extend Resourceful

  index_resources
  new_resource
  create_resource
  show_resource
  edit_resource
  update_resource
  destroy_resource

  alias :resource_path :user_path
  alias :resources_path :users_path
  alias :edit_resource_path :edit_user_path
  alias :new_resource_path :new_user_path

  def resource_params
    params.require(:resource).permit(:username, :password, :password_confirmation, :role)
      .merge(commit: params[:commit])
  end

  def resource_class
    Frontend::User
  end
end
