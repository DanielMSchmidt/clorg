class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :message_id
  belongs_to :user, :foreign_key => :user_id
  belongs_to :message, :foreign_key => :message_id


  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :message_id, :presence => true

end
