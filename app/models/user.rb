class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, length: { maximum: 200 }
  validates :name, presence: true, uniqueness: true, length: { in: 1..20 }
  validates :introduction, presence: true, length: { maximum: 200 }

  has_one_attached :user_image


  #フォロー先を参照する
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  #フォロワーを参照する
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower


  has_many :stories, dependent: :destroy
  has_many :story_comments, dependent: :destroy
  has_many :public_messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_stories, through: :favorites, source: :story

  has_many :group_users, foreign_key: "user_id", dependent: :destroy
  has_many :groups, through: :group_users, source: :group
  has_many :group_messages, foreign_key: "user_id"

  has_many :suggestions


  def get_user_image
    (user_image.attached?) ? user_image : 'no_image.jpg'
  end


  def follow(user_id)
    relationships.create!(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def self.guest
    find_or_create_by!(name: 'guestuser' , email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      users = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      users = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      users = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      users = User.where("name LIKE?","%#{word}%")
    else
      users = User.all
    end
    @users = users.where(is_deleted: false)
  end


  def invite_group(group)
    group_users.create!(group_id: group)
  end

  def leave_group(group)
    group_users.find_by(group_id: group).destroy
  end

  def requested?(group)
    group_users.exists?(group_id: group.id)
  end

  def joining?(group)
    group_users.find_by(group_id: group).request_is_accepted
  end

end
