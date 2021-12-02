class User < ApplicationRecord
  USERS_PER_PAGE = 30
  self.per_page = USERS_PER_PAGE

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :username, :email, presence: true

  def current?
    self == current_user
  end

  def admin?
    # TODO: check admin role
  end
end
