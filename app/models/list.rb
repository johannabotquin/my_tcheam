class List < ApplicationRecord
  belongs_to :user
  has_many :users, through: :list_managers

  validates :name, presence: true
end
