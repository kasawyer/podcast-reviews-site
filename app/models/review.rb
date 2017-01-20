class Review < ApplicationRecord
  belongs_to :user
  belongs_to :podcast

  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :body, presence: true
end
