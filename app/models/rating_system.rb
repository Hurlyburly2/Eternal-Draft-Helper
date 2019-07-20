class Rating_system < ApplicationRecord
  validates :name, presence: true
  belongs_to :card_set
  
  has_many :ratings
end
