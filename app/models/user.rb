class User < ApplicationRecord
  USERS_PER_PAGE = 30
  self.per_page = USERS_PER_PAGE

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :username, :email, presence: true

  def admin?
    roles&.include? Role.admin
  end
end
