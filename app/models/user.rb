class User < ApplicationRecord
  USERS_PER_PAGE = 30
  self.per_page = USERS_PER_PAGE

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  after_create :assign_user_role

  validates :username, presence: true, uniqueness: true

  def role?(role)
    roles&.include? Role.find_role(role)
  end

  private

  def assign_user_role
    roles&.push Role.find_role(:user) unless role?(:user)
  end
end
