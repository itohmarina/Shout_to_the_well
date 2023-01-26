class Comment < ApplicationRecord

  validates :body, length: { in: 1..30 }

  has_many :story_comments
  has_many :stories, through: :story_comments, source: :story

end
