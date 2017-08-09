class HashTag < ActiveRecord::Base

  has_many :events, through: :event2tags
  has_many :event2tags
  
end
