class AddIndexToUsers < ActiveRecord::Migration
  def change
  end
  add_index "users", ["id"], name: "index_users_on_id"
end
