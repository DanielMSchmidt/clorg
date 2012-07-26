class Messages < ActiveRecord::Base
  attr_accessible :content, :conversation_id

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 550 }
  validates :user_id, :presence => true
  validates :conversation_id, :presence => true

  default_scope :order => 'messages.created_at DESC'
end
