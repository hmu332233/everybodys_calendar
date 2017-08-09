class Event2tag < ActiveRecord::Base

  belongs_to :event
  belongs_to :hash_tag

end
