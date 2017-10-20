class User < ApplicationRecord
  attr_reader :current_user

  has_secure_password

  enum role: [:guest, :standard, :administrator]

  validates :username, presence: true
  validate :cannot_set_your_own_role

  def cannot_set_your_own_role
    !((self.role != self.role_was) && (@current_user.id == self.id))
  end
end
