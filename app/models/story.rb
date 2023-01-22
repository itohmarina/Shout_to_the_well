class Story < ApplicationRecord
  

  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :favoriting_user, through: :favorites, source: :user
  has_many :story_comments, dependent: :destroy
  has_many :comments, through: :story_comments, source: :comment

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

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

  #今日の投稿数検索
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  #過去の投稿数検索、n日前の投稿数
  scope :created_days_ago, -> (n){ where(created_at: n.days.ago.all_day) }

end
