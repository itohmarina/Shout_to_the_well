class Comment < ApplicationRecord
  
  has_many :story_comments
  
end
