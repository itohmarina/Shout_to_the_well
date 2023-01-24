class Genre < ApplicationRecord

  validates :name, length: { in: 1..10 }

  has_many :stories

end
