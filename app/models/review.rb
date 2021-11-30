class Review < ApplicationRecord
    REVIEWS_PER_PAGE = 30

    has_rich_text :content

    validates :name, :group, presence: true

    belongs_to :user, optional: true
    has_many :ratings, dependent: :destroy

    scope :user_rated, -> { where {|el| el.ratings.size > 0} }
    self.per_page = REVIEWS_PER_PAGE

    def average_users_rating
        (self.ratings&.inject(0){ |sum, el| sum + el.user_rating }.to_f || 0) / (self.ratings&.size.nonzero? || 1)
    end
end
