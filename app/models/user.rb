class User < ActiveRecord::Base
require 'role_model'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Integer representation of different roles/role groups
  attr_accessor :roles_mask

  include RoleModel

  roles_attribute :roles_mask
  roles :admin, :player

  has_many :answers
  has_many :questions, through: :answers

  belongs_to :game, dependent: :destroy
end
