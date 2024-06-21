class Team < ApplicationRecord
  has_many :rewards
  has_many :users
  has_one_attached :photo
  has_many :memories
  has_many :tasks

  validates :name, presence: true

  def run_wheel
    tasks = Task.where(team_id: self.id)
    tasks.each do |task|
      TaskManager.create(task: task, user: self.users.sample)

    end
  end
end
