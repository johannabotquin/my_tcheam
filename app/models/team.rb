class Team < ApplicationRecord
  has_many :rewards
  has_many :users
  has_one_attached :photo
  has_many :memories

  validates :name, presence: true
end
