class Tag < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :messages
  has_many :events, :dependent => :destroy

  validates :name, :color, presence: true
end
