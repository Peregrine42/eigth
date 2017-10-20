module ResourcefulBasicSetup
  extend ActiveSupport::Concern

  included do
    attr_reader :resource
    helper_method :resource
    attr_reader :resources
    helper_method :resources
    helper_method :resource_path
    helper_method :resources_path
    helper_method :edit_resource_path
    helper_method :new_resource_path
  end

  def setup_new_page
  end

  def setup_show_page
  end

  def setup_edit_page
  end
end
