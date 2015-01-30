class AddLocationToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :location, :string
  end
end
