class StoryComment < ApplicationRecord

  belongs_to :comment
  belongs_to :story
  belongs_to :user

end
