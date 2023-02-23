class PublicMessage < ApplicationRecord
  
  validates :body, presence: true, length: { in: 1..200 }
  
  belongs_to :user
  
end
