class AddQuantifierToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :quantifier, :string
  end
end
