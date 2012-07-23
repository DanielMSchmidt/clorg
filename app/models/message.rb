class Message < ActiveRecord::Base
  attr_accessible :content, :reply_id
end
