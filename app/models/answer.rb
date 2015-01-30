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

class Answer < ActiveRecord::Base

  require 'socket'

  belongs_to :user
  belongs_to :question


  has_attached_file :answer_image,
                    :default_url => '',
                    :styles =>
                        {
                            :large    => ['800>',      :png, :quality => 90],
                            :retina   => ['1600>',     :png, :quality => 30]
                        },
                    :convert_options =>
                        {
                            :large    => '-set colorspace sRGB -strip',
                            :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
                        }
  validates_attachment_content_type :answer_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
