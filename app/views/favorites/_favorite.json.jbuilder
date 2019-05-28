json.extract! favorite, :id, :name, :location_id, :user_id, :created_at, :updated_at
json.url favorite_url(favorite, format: :json)
