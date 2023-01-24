class Suggestion < ApplicationRecord
  
  validates :title, length: { in: 1..50 }
  validates :body, length: { in: 1..1200 }
  
  belongs_to :user

end
