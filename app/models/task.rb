class Task < ApplicationRecord
  belongs_to :user

  validates :name, :category, :points, :deadline, :reccurence, :achieved, :members, presence: true
end
