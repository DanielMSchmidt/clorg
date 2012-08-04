class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :messageTagAssignments, dependent: :delete_all
  has_many :messages, through: :message_tag_assignments
end
