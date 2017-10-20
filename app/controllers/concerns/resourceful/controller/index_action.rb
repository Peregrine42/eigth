module Resourceful
  module Controller
    module IndexAction
      extend ActiveSupport::Concern

      def index
        @resources = resource_class.all
      end
    end
  end
end
