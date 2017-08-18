class HashTag < ActiveRecord::Base

  has_many :events, through: :event2tags
  has_many :event2tags
  
  def self.find_by_name_or_save(hash_tag_names)
    hash_tags = []
    hash_tag_names.each do |hash_tag_name|
      hash_tag = HashTag.find_by_name(hash_tag_name)
      if hash_tag == nil
        hash_tag = HashTag.create(name: hash_tag_name)
      end
      
      hash_tags << hash_tag
    end
    
    return hash_tags
  end
  
end
