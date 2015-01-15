json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :location, :tele, :verify_code, :fb_token, :notification_token, :invite_code, :email, :status
  json.url user_url(user, format: :json)
end
