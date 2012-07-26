class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :message_id
  has_one :user, :foreign_key => :user_id
  belongs_to :post, :foreign_key => :message_id


  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :message_id, :presence => true

end
