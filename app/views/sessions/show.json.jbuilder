#json.extract! @user, :id, :email, :name, :game_id, :created_at, :updated_at, :isAdmin
#json.key do
#  @user.api_key.key
#end
json.(@user, :email, :name, :game_id, :isAdmin, :id)
json.(@user.api_key, :key)