class Message < ActiveRecord::Base
  attr_accessible :content, :user_id, :tag_id
  default_scope :order => 'created_at DESC'

  has_many :comments
  belongs_to :user, :foreign_key => :user_id
  has_one :tag, :foreign_key => :tag_id

  validates :content, :user_id, :presence => true
end