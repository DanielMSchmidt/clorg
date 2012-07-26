class Message < ActiveRecord::Base
  attr_accessible :content, :user_id
  has_many :comments
  belongs_to :user, :foreign_key => :user_id

  validates :content, :presence => true
  validates :user_id, :presence => true

end
