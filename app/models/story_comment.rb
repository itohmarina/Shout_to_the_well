class StoryComment < ApplicationRecord

  has_one_attached :user_icon do |attachable|
    attachable.variant :icon, resize_to_limit: [30, 30]
  end

  belongs_to :comment

  #<%= image_tag story_comment.avatar.variant(:icon) %>をviewに貼り付ける

end
