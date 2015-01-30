class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,  default: "", null:false
      t.string :name
      t.integer :roles_mask
      t.integer :game_id
      t.string :encrypted_password,  default: "", null:false
      t.string :salt,  default: "", null:false

      t.timestamps
    end
    
    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  end
end
