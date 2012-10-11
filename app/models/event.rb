class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at, :user_id, :tag_list
  acts_as_taggable

  default_scope includes(:user)
	scope :within, lambda { |start, ending| where(:start_at => start..ending) }

  belongs_to :user, foreign_key: :user_id

  validates :name, :start_at, :end_at, :user_id, presence: true
end
