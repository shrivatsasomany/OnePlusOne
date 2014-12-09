# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :quantifiers, dependent: :destroy
  has_many :question_types, dependent: :destroy
end
