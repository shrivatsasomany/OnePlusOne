class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, uniqueness: true
  before_save :encrypt_password



  has_many :answers
  has_many :questions, through: :answers

  belongs_to :game, dependent: :destroy

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
end