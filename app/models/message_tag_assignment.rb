class MessageTagAssignment < ActiveRecord::Base
  attr_accessible :message_id, :tag_id
  belongs_to :message, foreign_key: :message_id
  belongs_to :tag, foreign_key: :tag_id
end
