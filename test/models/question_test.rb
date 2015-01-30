# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  question_text :string(255)
#  description   :string(255)
#  location      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  picture       :string(255)
#  game_id       :integer
#  question_type :string(255)
#  is_quantifier :boolean
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
