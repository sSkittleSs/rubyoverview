class Role < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :users, through: :user_roles

    scope :user, -> { find_or_create_by! name: 'user' }
    scope :admin, -> { find_or_create_by! name: 'admin' }
    scope :banned, -> { find_or_create_by! name: 'banned' }
end
