class Reward < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :name, presence: true
  validates :goal, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
