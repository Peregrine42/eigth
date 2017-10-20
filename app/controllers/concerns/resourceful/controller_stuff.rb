module Ressy
  module Controller
    module NewAction
      extend ActiveSupport::Concern

      def new
        @resource = resource_class.new
        setup_new_page
      end
    end
  end
end


# def create_resource
#   define_method(:create) do
#     @resource = resource_class.new
#     @resource.assign_attributes(resource_params)
#     if @resource.save
#       flash[:success] = self.class::CREATE_SUCCESS_MESSAGE
#       redirect_to resource_path(@resource)
#     else
#       flash.now[:error] = self.class::CREATE_FAILURE_MESSAGE 
#       setup_new_page
#       render :new
#     end
#   end
# end

# def show_resource
#   define_method(:show) do
#     @resource = resource_class.find(params[:id])
#     setup_show_page
#   end
# end

# def edit_resource
#   define_method(:edit) do
#     @resource = resource_class.find(params[:id])
#     setup_edit_page
#   end
# end

# def update_resource
#   define_method(:update) do
#     @resource = resource_class.find(params[:id])
#     @resource.assign_attributes(resource_params)
#     if @resource.save
#       flash[:success] = self.class::UPDATE_SUCCESS_MESSAGE
#       redirect_to resource_path(@resource)
#     else
#       flash.now[:error] = self.class::UPDATE_FAILURE_MESSAGE
#       setup_edit_page
#       render :edit
#     end
#   end
# end

# def destroy_resource
#   define_method(:destroy) do
#     @resource = resource_class.find(params[:id])
#     if @resource.destroy
#       flash[:success] = self.class::DELETE_SUCCESS_MESSAGE
#       redirect_to resources_path
#     else
#       flash.now[:error] = self.class::DELETE_FAILURE_MESSAGE
#       setup_show_page
#       render :show
#     end
#   end
# end

# def index_resources
#   define_method(:index) do
#     @resources = resource_class.all
#   end
# end
