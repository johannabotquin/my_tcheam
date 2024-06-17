class Team < ApplicationRecord
  has_many :rewards
  has_many :users

  validates :name, presence: true
end
