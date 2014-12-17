class AddAttachmentAnswerImageToAnswers < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.attachment :answer_image
    end
  end

  def self.down
    remove_attachment :answers, :answer_image
  end
end
