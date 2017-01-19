class Host < ApplicationRecord
  has_many :podcast_hosts
  has_many :podcasts, through: :podcast_hosts

  validates :name, presence: true
end
