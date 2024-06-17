class Reward < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :name, :goal, presence: true
end
