class Host < ApplicationRecord
  has_many :podcast_hosts
  has_many :podcasts, through: :podcast_hosts

  validates :first_name, presence: true
  validates :last_name, presence: true
end
