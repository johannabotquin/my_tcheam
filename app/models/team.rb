class Team < ApplicationRecord
  has_many :rewards
  has_many :users
  has_one_attached :photo
  has_many :memories
  has_many :tasks

  validates :name, presence: true

  has_one :chatroom

  def run_wheel
  end
end
