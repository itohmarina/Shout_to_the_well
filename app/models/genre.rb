class Genre < ApplicationRecord

  validates :name, presence: true, length: { in: 1..10 }

  has_many :stories

end
