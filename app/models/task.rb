class Task < ApplicationRecord
  CATEGORIES = ["Tu crains dégun mais tu dois en prendre soin... (Santé)",
                "La maison elle va pas se gérer seule, figure de poulpe ! (Gestion du foyer)",
                "Fais tes papiers avant que ce soit le oaï ! (Administratif)"]

  PRIORITY = [1, 2, 3]

  belongs_to :user
  has_many :task_managers
  has_many :users, through: :task_managers

  # validates :name, :category, :points, :deadline, :reccurence, :achieved, presence: true
  # validates :points, numericality: { only_integer: true }
  # validates :name, length: { maximum: 100 }
  # validates :category, inclusion: { in: CATEGORIES }
  # # validates :deadline, presence: true
  # validates :deadline, presence: true
  # validates :reccurence, inclusion: { in: [true, false] }
  # validates :achieved, inclusion: { in: [true, false] }
  # validates :deadline, default: Date.today
end
