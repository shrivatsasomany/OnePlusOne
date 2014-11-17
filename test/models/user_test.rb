# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)      default(""), not null
#  name               :string(255)
#  game_id            :integer
#  encrypted_password :string(255)      default(""), not null
#  salt               :string(255)      default(""), not null
#  created_at         :datetime
#  updated_at         :datetime
#  isAdmin            :boolean
#  roles_mask         :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
