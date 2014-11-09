class AddPicturesToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :picture, :string
  end
end
