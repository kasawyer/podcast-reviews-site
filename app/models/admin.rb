class Admin < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :podcasts
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with:
     /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :password,
    presence: true,
    length: { minimum: 6, maximum: 120 },
    on: :create
  validates :password,
    length: { minimum: 6, maximum: 120 },
    on: :update,
    allow_blank: true
end
