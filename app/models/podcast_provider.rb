class PodcastProvider < ApplicationRecord
  belongs_to :provider
  belongs_to :podcast

  validates :provider, presence: true
  validates :podcast, presence: true
  validates :provider, uniqueness: { scope: :podcast }
end
