require 'digest'
class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password
  attr_accessible :email, :username, :password, :password_confirmation, :phone, :street, :zip, :location

  has_many :messages, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :events, :dependent => :destroy

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email   
end