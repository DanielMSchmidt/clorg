require 'digest'
class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password
  attr_accessible :email, :username, :password, :password_confirmation, :phone, :street, :zip, :location

  has_many :messages, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :events, :dependent => :destroy

  #regular expression to validate mail addresses
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
   :presence => true,
   :length => { :maximum => 50 },
   :uniqueness => { :case_sensitive => false }

  validates :email,
   :presence => true,
   :format => { :with => email_regex },
   :uniqueness => { :case_sensitive => false }

   #Automatically creates the virtual attribute 'password_confirmation'
   validates :password,
   :presence => true,
   :confirmation => true,
   :length => { :within => 6..40 }
   
end