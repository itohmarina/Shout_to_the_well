class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :name, uniqueness: true

  has_one_attached :user_image

  has_many :stories, dependent: :destroy
  has_many :story_comments, dependent: :destroy
  has_many :public_messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_stories, through: :favorites, source: :story

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users, source: :group


  def get_user_image
    (user_image.attached?) ? user_image : 'no_image.jpg'
  end

  # has_one_attached :user_icon do |attachable|
  #   attachable.variant :icon, resize_to_limit: [30, 30]
  # end
  #<%= image_tag story_comment.avatar.variant(:icon) %>をviewに貼り付ける


  def self.guest
    find_or_create_by!(name: 'guestuser' , email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end


end
