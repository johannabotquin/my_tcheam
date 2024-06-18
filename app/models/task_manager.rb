class TaskManager < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :task_id, :user_id, presence: true
end
