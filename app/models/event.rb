class Event < ActiveRecord::Base
  
  belongs_to :calendar

  has_many :hash_tags, through: :event2tags
  has_many :event2tags

end
