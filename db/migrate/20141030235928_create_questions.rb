class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
