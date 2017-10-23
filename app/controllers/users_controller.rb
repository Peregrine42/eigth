class UsersController < ApplicationController
  include ResourcefulConstants
  include ResourcefulBasicSetup
  include Resourceful

  def index
    index_resources
  end

  def new
    new_resource
  end

  def create
    create_resource
  end

  def show
    show_resource
  end

  def edit
    edit_resource
  end

  def update
    update_resource
  end

  def destroy
    destroy_resource
  end

  alias :resource_path :user_path
  alias :resources_path :users_path
  alias :edit_resource_path :edit_user_path
  alias :new_resource_path :new_user_path

  def resource_params
    params.require(:resource).permit(:username, :password, :password_confirmation, :role)
  end

  def resource_class
    Frontend::User
  end
end
