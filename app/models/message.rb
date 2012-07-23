class Message < ActiveRecord::Base
  attr_accessible :content
  has_many :comments
	belongs_to :user, :foreign_key => :user_id  

end
