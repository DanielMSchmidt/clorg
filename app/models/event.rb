class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user, foreign_key: :user_id
  belongs_to :tag, foreign_key: :tag_id
end
