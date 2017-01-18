class Podcast < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :podcast_hosts
  has_many :hosts, through: :podcast_hosts
  belongs_to :provider

  validates :name, presence: true
  validates :provider, presence: true
  validates :release_year, numericality: true, inclusion: { in: 1900..3000 }, allow_nil: true
  validates :name, uniqueness: { scope: :provider }
end
