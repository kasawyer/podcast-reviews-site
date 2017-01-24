class Review < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :podcast

  validates :rating, presence: true, numericality: true, inclusion: {
    in: 1..5, message: "must be between 1 - 5"
  }
  validates :body, presence: true
end
