class Story < ApplicationRecord
  
  # has_one_attached :story_image
  
  belongs_to :user
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @story = Story.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @story = Story.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @story = Story.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @story = Story.where("title LIKE?","%#{word}%")
    else
      @story = Story.all
    end
  end
  
end
