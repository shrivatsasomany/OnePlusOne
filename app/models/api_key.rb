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

class ApiKey < ActiveRecord::Base
  belongs_to :user

  def add_key(user)
    self.key = SecureRandom.hex
    self.user = user
    self.save
  end
end
