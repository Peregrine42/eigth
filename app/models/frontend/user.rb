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

    def initialize resource=nil, current_user=nil
      @resource = resource || resource_class.new
      if current_user && current_user.draft_user
        @draft = current_user.draft_user
        @draft.activate
      else
        @draft = draft_class.new
      end
    end

    def name
      return @draft.name if @draft.active?
      @resource.name
    end

    def username
      return @draft.name if @draft.active?
      @resource.name
    end

    def role
      return @draft.role if @draft.active?
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
      @draft.activate if commit == "Save Draft"
    end

    def frontend_save current_user=nil
      draft_result = @draft.frontend_save(current_user) 
      return !draft_result if draft_result
      @resource.frontend_save
    end

    def frontend_destroy
      @resource.frontend_destroy
    end

    def frontend_errors
      @resource.errors
    end

    def draft?
      @draft.active?
    end
  end
end
