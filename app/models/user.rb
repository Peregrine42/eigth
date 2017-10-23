class User < ApplicationRecord
  class << self
    def frontend_find id
      find(id)
    end

    def frontend_list
      order(name: :asc)
    end
  end

  def frontend_id
    id
  end

  def frontend_assign_attributes args
    assign_attributes args
  end

  def frontend_save
    save
  end

  def frontend_destroy
    destroy
  end

  has_secure_password

  enum role: [:guest, :standard, :administrator]
  enum status: [:draft, :live]

  validates :username, presence: true, uniqueness: true
  alias_attribute :name, :username
  # validate :cannot_set_your_own_role
  validate :username_must_be_all_lowercase_with_underscores

  def username_must_be_all_lowercase_with_underscores
    unless username.match(/^[0-9a-z_]+$/)
      errors.add(:username, "contains non-lowercase letters, or other symbols")
    end
  end

  def cannot_set_your_own_role
    !((self.role != self.role_was) && (@current_user.id == self.id))
  end

  def authenticated?
    persisted?
  end
end
