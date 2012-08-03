class Message < ActiveRecord::Base
  attr_accessible :content, :user_id

  has_many :message_tag_assignments
  has_many :tags, through: :message_tag_assignments

  has_many :comments
  belongs_to :user, :foreign_key => :user_id
  default_scope :order => 'created_at DESC'

  validates :content, :presence => true
  validates :user_id, :presence => true

end
