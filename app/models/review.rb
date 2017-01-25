class Review < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :podcast
  has_many :votes

  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: "must be between 1 - 5" }
  validates :body, presence: true
  validates :user, presence: true
  validates :podcast, presence: true

  def total_votes
    total = 0
    votes.each do |vote|
      total += vote.value
    end
    total
  end
end
