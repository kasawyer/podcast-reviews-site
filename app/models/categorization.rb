class Categorization < ApplicationRecord
  belongs_to :category
  belongs_to :podcast

  validates :category, presence: true
  validates :podcast, presence: true
  validates :category, uniqueness: { scope: :podcast }
end
