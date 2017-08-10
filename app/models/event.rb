class Event < ActiveRecord::Base
  
  belongs_to :calendar

  has_many :hash_tags, through: :event2tags
  has_many :event2tags
  
    # 모든 게시글 중 해시태그를 포함한 post를 찾는다.
    # parameter : tag_name
    # return : posts - list
    # def self.find_by_tag_name_at_all_posts(tag_name)
        
    #     posts = []
        
    #     Post.all.each do |post|
    #       unless post.hash_tags.find_by_name(tag_name).nil?
    #         posts << post
    #       end
    #     end
        
    #     return posts
    # end
    
    # 특정 calendar의  events 중 해시태그를 포함한 event를 찾는다.
    # parameter : calendar_id, tag_name
    # return : events - list
    def self.find_by_tag_name_at_calendar(_calendar_id, tag_name)

        calendar = Calendar.find(_calendar_id) 
        events = []
        
        calendar.events.each do |event|
          unless event.hash_tags.find_by_name(tag_name).nil?
            events << event
          end
        end
        
        return events
    end

end
