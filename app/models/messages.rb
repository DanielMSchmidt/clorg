class Messages < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  default_scope :order => 'messages.created_at DESC'
end
