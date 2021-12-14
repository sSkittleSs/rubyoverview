class Category < ApplicationRecord
    CATEGORIES_PER_PAGE = 30
    self.per_page = CATEGORIES_PER_PAGE
end
