module Resourceful
  def new_resource
    @resource = resource_class.new
    setup_new_page
  end

  def create_resource
    @resource = resource_class.new
    @resource.frontend_assign_attributes(resource_params)
    if @resource.frontend_save
      flash[:success] = create_success_message
      redirect_to resource_path(@resource.frontend_id)
    else
      flash.now[:error] = create_failure_message 
      setup_new_page
      render :new
    end
  end

  def show_resource
    @resource = resource_class.frontend_find(params[:id])
    setup_show_page
  end

  def edit_resource
    @resource = resource_class.frontend_find(params[:id])
    setup_edit_page
  end

  def update_resource
    @resource = resource_class.frontend_find(params[:id])
    @resource.frontend_assign_attributes(resource_params)
    if @resource.frontend_save
      flash[:success] = update_success_message
      redirect_to resource_path(@resource.frontend_id)
    else
      flash.now[:error] = update_failure_message
      setup_edit_page
      render :edit
    end
  end

  def destroy_resource
    @resource = resource_class.frontend_find(params[:id])
    if @resource.frontend_destroy
      flash[:success] = delete_success_message
      redirect_to resources_path
    else
      flash.now[:error] = delete_failure_message
      setup_show_page
      render :show
    end
  end

  def index_resources
    @resources = resource_class.frontend_list
  end
end
