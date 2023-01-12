class Story < ApplicationRecord
  
  # has_one_attached :story_image
  
  belongs_to :user
  
end
