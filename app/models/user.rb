class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation

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

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

