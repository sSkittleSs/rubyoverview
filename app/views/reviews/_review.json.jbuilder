json.extract! review, :id, :name, :group, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
