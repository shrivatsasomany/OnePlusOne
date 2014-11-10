json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :game_id, :created_at, :updated_at
  json.url user_url(user, format: :json)
end
