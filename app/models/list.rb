class List < ApplicationRecord
  belongs_to :user
  has_many :list_managers, dependent: :destroy
  has_many :users, through: :list_managers

  validates :name, presence: true
end
