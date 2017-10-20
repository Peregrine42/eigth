module ResourcefulHelper
  def show_resource
    define_method(:show) do
      @resource = resource_class.find(params[:id])
      setup_show_page
    end
  end
end

