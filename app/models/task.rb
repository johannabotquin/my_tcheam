class Task < ApplicationRecord
  CATEGORIES = ["Tu crains dégun mais tu dois en prendre soin",
                "La maison elle va pas se gérer seule, figure de poulpe !",
                "Fais tes papiers avant que ce soit le oaï !"]
  PRIORITY = [1, 2, 3]
  
  belongs_to :user
  has_many :users, through: :task_managers

  # validates :name, :category, :points, :deadline, :reccurence, :achieved, presence: true
  # validates :points, numericality: { only_integer: true }
  # validates :name, length: { maximum: 100 }
  # validates :category, inclusion: { in: CATEGORIES }
  # # validates :deadline, presence: true
  # validates :reccurence, inclusion: { in: [true, false] }
  # validates :achieved, inclusion: { in: [true, false] }
end
