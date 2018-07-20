class Game < ApplicationRecord
  has_many :codenames
#  validates :password, presence: true,
#                       length: { minimum: 5 }
end
