class Provider < ApplicationRecord
  has_many :podcast_providers
  has_many :podcasts, through: :podcast_providers
  
  validates :name, presence: true
end
