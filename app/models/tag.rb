class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :message_tag_assignments
  has_many :messages, through: :message_tag_assignments
end
