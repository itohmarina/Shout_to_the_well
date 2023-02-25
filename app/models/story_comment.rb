class StoryComment < ApplicationRecord

  validates :comment, presence: true

  belongs_to :comment
  belongs_to :story
  belongs_to :user

end
