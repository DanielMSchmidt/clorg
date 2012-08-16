class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user, through: :user_id
  belongs_to :tag, through: :tag_id
end
