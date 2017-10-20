module Resourceful
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
