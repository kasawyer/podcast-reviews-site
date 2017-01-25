class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :value, presence: true
  validates :user, presence: true
  validates :review, presence: true
  validates :value, numericality: true, inclusion: { in: [-1, 0, 1] }
end
