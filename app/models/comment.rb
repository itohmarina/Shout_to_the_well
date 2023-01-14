class Comment < ApplicationRecord
  
  has_many :story_comments
  has_many :stories, through: :story_comments, source: :story
  
end
