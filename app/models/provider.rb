class Provider < ApplicationRecord
  has_many :podcasts

  validates :name, presence: true, uniqueness: true
end
