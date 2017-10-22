module Frontend
  class User
    class << self
      def resource_class
        ::User
      end

      def draft_class
        ::Draft::User
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

    def draft_class
      self.class.draft_class
    end

    def initialize resource=nil
      @resource = resource || resource_class.new
      @draft = draft_class.new
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
      hash = args.to_h
      commit = hash.delete(:commit)
      @draft.frontend_assign_attributes(commit, hash)
      @resource.frontend_assign_attributes hash
    end

    def frontend_save current_user=nil
      @resource.frontend_save current_user
    end

    def frontend_destroy
      @resource.frontend_destroy
    end

    def frontend_errors
      @resource.errors
    end
  end
end
