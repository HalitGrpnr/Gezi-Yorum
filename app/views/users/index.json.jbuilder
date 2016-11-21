json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :birthday, :gender, :bio, :location, :is_admin
  json.url user_url(user, format: :json)
end
