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

require 'role_model'
class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, uniqueness: true
  before_save :encrypt_password

  include RoleModel
  roles_attribute = :roles_mask
  roles :admin, :faculty, :student

  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
  has_one :api_key, dependent: :destroy

  belongs_to :game

  def encrypt_password
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  def destroy_api_key
    if !self.api_key.nil?
      ApiKey.find_by_user_id(self.id).delete
    end
  end

  def isAdministrator
    return self.isAdmin
  end

end
