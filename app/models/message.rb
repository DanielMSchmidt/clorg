# == Schema Information
#
# Table name: messages
#
#  id             :integer         not null, primary key
#  userid         :integer
#  message        :text
#  conversationid :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Message < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  has_many :messages


  attr_accessible :message

  belongs_to :user


  validates :message,
	:presence => true

  

end

