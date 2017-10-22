module Resourceful
  def new_resource
    define_method :new do
      @resource = resource_class.new
      setup_new_page
    end
  end

  def create_resource
    define_method(:create) do
      @resource = resource_class.new
      @resource.frontend_assign_attributes(resource_params)
      if @resource.frontend_save
        flash.send(:[]=, *create_success_message(@resource))
        redirect_to resource_path(@resource.frontend_id)
      else
        flash.now.send(:[]=, *create_failure_message(@resource))
        setup_new_page
        render :new
      end
    end
  end
  
  def show_resource
    define_method :show do
      @resource = resource_class.frontend_find(params[:id])
      setup_show_page
    end
  end

  def edit_resource
    define_method(:edit) do
      @resource = resource_class.frontend_find(params[:id])
      setup_edit_page
    end
  end

  def update_resource
    define_method(:update) do
      @resource = resource_class.frontend_find(params[:id])
      @resource.frontend_assign_attributes(resource_params)
      if @resource.frontend_save
        flash.send(:[]=, *update_success_message(@resource))
        redirect_to resource_path(@resource.frontend_id)
      else
        flash.now.send(:[]=, *update_failure_message(@resource))
        setup_edit_page
        render :edit
      end
    end
  end

  def destroy_resource
    define_method(:destroy) do
      @resource = resource_class.frontend_find(params[:id])
      if @resource.frontend_destroy
        flash.send(:[]=, *delete_success_message(@resource))
        redirect_to resources_path
      else
        flash.now.send(:[]=, *delete_failure_message(@resource))
        setup_show_page
        render :show
      end
    end
  end

  def index_resources
    define_method :index do
      @resources = resource_class.frontend_list
    end
  end
end
