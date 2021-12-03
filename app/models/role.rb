class Role < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :users, through: :user_roles

    scope :find_role, lambda { |role| find_by! name: role }

end
