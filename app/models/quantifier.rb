# == Schema Information
#
# Table name: quantifiers
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  game_id    :integer
#

class Quantifier < ActiveRecord::Base
end
