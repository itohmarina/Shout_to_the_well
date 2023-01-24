class GroupMessage < ApplicationRecord

  validates :body, length: { in: 1..200 }

  belongs_to :group
  belongs_to :user

end
