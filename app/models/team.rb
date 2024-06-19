class Team < ApplicationRecord
  has_many :rewards
  has_many :users
  has_one_attached :photo

  validates :name, presence: true
end
