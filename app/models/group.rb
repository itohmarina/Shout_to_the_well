class Group < ApplicationRecord
  
  validates :name, presence: true, length: { in: 1..20 }
  validates :introduction, presence: true, length: { maximum: 200 }

  has_many :group_users, foreign_key: "group_id"
  has_many :users, through: :group_users, source: :user
  has_many :group_messages, foreign_key: "group_id"

  has_one_attached :group_image

  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      groups = Group.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      groups = Group.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      groups = Group.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      groups = Group.where("name LIKE?","%#{word}%")
    else
      groups = Group.all
    end
    @groups = groups.where(is_deleted: false)
  end
  
end
