module Frontend
  class User
    class << self
      def resource_class
        ::User
      end
      
      def frontend_list
        resource_class.frontend_list.map { |r| new(r) }
      end

      def frontend_find id
        new(resource_class.frontend_find(id))
      end

      def roles
        resource_class.roles
      end
    end

    def resource_class
      self.class.resource_class
    end

    def initialize resource=nil
      @resource = resource || resource_class.new
    end

    def name
      @resource.name
    end

    def username
      @resource.name
    end

    def role
      @resource.role
    end

    def frontend_id
      @resource.frontend_id
    end

    def frontend_persisted?
      @resource.persisted?
    end

    def frontend_assign_attributes args
      @resource.frontend_assign_attributes args
    end

    def frontend_save
      @resource.frontend_save
    end

    def frontend_destroy
      @resource.frontend_destroy
    end

    def frontend_errors
      @resource.errors
    end
  end
end
