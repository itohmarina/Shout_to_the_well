class Comment < ApplicationRecord

  validates :body, presence: true, length: { in: 1..30 }

  has_many :story_comments, foreign_key: "comment_id"
  has_many :stories, through: :story_comments, source: :story

end
