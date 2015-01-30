# == Schema Information
#
# Table name: answers
#
#  id                        :integer          not null, primary key
#  user_id                   :integer
#  question_id               :integer
#  created_at                :datetime
#  updated_at                :datetime
#  answer_text               :string(255)
#  quantifier                :string(255)
#  location                  :string(255)
#  answer_image_file_name    :string(255)
#  answer_image_content_type :string(255)
#  answer_image_file_size    :integer
#  answer_image_updated_at   :datetime
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
