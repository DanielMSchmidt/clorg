class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at, :color, :tag_id, :user_id
  belongs_to :user, foreign_key: :user_id
  belongs_to :tag, foreign_key: :tag_id

  #validations
  validates :name, :start_at, :end_at, :color, :tag_id, :user_id, presence: true
  validates :color, :hex_color => true

  has_event_calendar
end
