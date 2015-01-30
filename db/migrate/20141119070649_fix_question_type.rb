class FixQuestionType < ActiveRecord::Migration
  def change
	rename_column :question_types, :type, :type_text
  end
end
