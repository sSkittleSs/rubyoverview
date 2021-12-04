class UserRole < ApplicationRecord
  validates :user_id, :role_id, presence: true

  belongs_to :user
  belongs_to :role
end
