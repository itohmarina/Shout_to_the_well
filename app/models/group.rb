class Group < ApplicationRecord

  has_many :group_users, foreign_key: "group_id"
  has_many :users, through: :group_users, source: :user
  has_many :group_messages, foreign_key: "group_id"

  has_one_attached :group_image

  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end


end
