# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  key        :string(255)
#  user_id    :integer
#

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
