class Podcast < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :podcast_hosts
  has_many :hosts, through: :podcast_hosts
  belongs_to :provider
  accepts_nested_attributes_for :hosts

  validates :name, presence: true
  validates :provider_id, presence: true
  validates :release_year, numericality: true, allow_nil: true
  validates :release_year, inclusion: { in: 1900..3000 }, allow_nil: true
  validates :name, uniqueness: { scope: :provider }

  def provider_name=(name)
    self.provider = Provider.find_or_create_by(name: name)
  end
end
