class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :messages
  has_many :events, :dependent => :destroy
end
