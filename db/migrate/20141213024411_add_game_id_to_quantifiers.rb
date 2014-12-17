class AddGameIdToQuantifiers < ActiveRecord::Migration
  def change
    add_column :quantifiers, :game_id, :integer
  end
end
