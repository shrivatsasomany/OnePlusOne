class Question < ActiveRecord::Base

  has_many :answers
  has_many :users, through: :answers

  belongs_to :game, dependent: :destroy

  attr_accessor :picture
  mount_uploader :picture, PictureUploader

  validates :question_text, uniqueness: true

  def as_json(options)
    super(:only => [:question_text, :description, :location, :question_type])
  end

end
