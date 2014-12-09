# == Schema Information
#
# Table name: question_types
#
#  id         :integer          not null, primary key
#  type_text  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class QuestionType < ActiveRecord::Base
end
