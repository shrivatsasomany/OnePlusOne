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

class Question < ActiveRecord::Base

  has_many :answers, dependent: :destroy
  has_many :users, through: :answers

  belongs_to :game

  attr_accessor :picture
  mount_uploader :picture, PictureUploader

  validates :question_text, uniqueness: true

  def as_json(options)
    super(:only => [:question_text, :description, :location, :question_type])
  end

end
