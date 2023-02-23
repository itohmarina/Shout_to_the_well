class Suggestion < ApplicationRecord

  validates :title, presence: true, length: { in: 1..50 }
  validates :body, presence: true, length: { in: 1..1200 }

  belongs_to :user

end
