class PodcastHost < ApplicationRecord
  belongs_to :host
  belongs_to :podcast

  validates :host, presence: true
  validates :podcast, presence: true
  validates :host, uniqueness: { scope: :podcast }
end
