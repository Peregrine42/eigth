module Draft
  class User < ApplicationRecord
    self.table_name = "draft_users"

    def frontend_assign_attributes commit, args
      if commit == "Clear Draft"
        @to_be_deleted = true 
        @active = true
      end
      return unless commit == "Save Draft"
      args.delete(:password)
      args.delete(:password_confirmation)
      assign_attributes args
    end

    def active?
      @active
    end

    def activate
      @active = true
    end

    def frontend_save current_user
      return unless current_user
      return true if @to_be_deleted && current_user.draft_user.destroy
      return unless active?
      save && current_user.update(draft_user_id: id)
    end

    def name
      username
    end
  end
end
