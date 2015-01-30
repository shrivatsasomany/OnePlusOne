class AddQuantifierFlagToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_quantifier, :boolean
  end
end
