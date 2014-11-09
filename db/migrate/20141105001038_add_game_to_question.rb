class AddGameToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :game_id, :integer
  end
end
