class UsersController < ApplicationController
  
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

  def resource_class
    User
  end

  def new
    @resource = resource_class.new
    setup_new_page
  end

  def create
    @resource = resource_class.new
    @resource.assign_attributes(user_params)
    if @resource.save
      flash[:success] = "Success! User created."
      redirect_to resource_path(@resource)
    else
      flash[:error] = "Could not create a new User."
      setup_new_page
      render :new
    end
  end

  def show
    @resource = resource_class.find(params[:id])
    setup_show_page
  end

  def edit
    @resource = resource_class.find(params[:id])
    setup_edit_page
  end

  def update
    @resource = resource_class.find(params[:id])
    @resource.assign_attributes(user_params)
    if @resource.save
      flash[:success] = "Success! User updated."
      redirect_to resource_path(@resource)
    else
      flash[:error] = "Could not update the User."
      setup_edit_page
      render :edit
    end
  end

  def destroy
    @resource = resource_class.find(params[:id])
    if @resource.destroy
      flash[:success] = "Success! User deleted."
      redirect_to resources_path
    else
      flash[:error] = "Could not delete the User."
      setup_show_page
      render :show
    end
  end

  def index
    @resources = resource_class.all
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end

  def setup_new_page
  end

  def setup_show_page
  end

  def setup_edit_page
  end

end
