json.extract! user, :id, :name, :created_at, :updated_at
json.url users_url(user, format: :json)
