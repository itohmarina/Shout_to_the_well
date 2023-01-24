class PublicMessage < ApplicationRecord
  
  validates :body, length: { in: 1..200 }
  
  belongs_to :user
  
end
