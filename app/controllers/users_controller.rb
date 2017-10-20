class UsersController < ApplicationController
  
  attr_reader :resource
  helper_method :resource
  attr_reader :resources
  helper_method :resources

  alias :resource_path :user_path

  def resource_class
    User
  end

  def new
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

  def edit
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

  def show
    setup_show_page
  end

  def index
    @resources = resource_class.all
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end

  def setup_new_page
    @resource = resource_class.new
  end

  def setup_show_page
    @resource = resource_class.find(params[:id])
  end

  def setup_edit_page
    @resource = resource_class.find(params[:id])
  end

end
