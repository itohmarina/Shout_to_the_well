class StoryComment < ApplicationRecord

  validates :comment_id, presence: true

  belongs_to :comment
  belongs_to :story
  belongs_to :user

end
