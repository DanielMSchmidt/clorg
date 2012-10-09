class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at, :tag_id, :user_id, :tag_list
  acts_as_taggable

  default_scope includes(:user)
	scope :within, lambda { |start, ending| where(:start_at => start..ending) }

  belongs_to :user, foreign_key: :user_id
  belongs_to :tag, foreign_key: :tag_id

  validates :name, :start_at, :end_at, :tag_id, :user_id, presence: true
end
