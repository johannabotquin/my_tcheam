class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, through: :task_managers
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :lists, through: :list_managers
  has_many :rewards

  validates :first_name, :last_name, presence: true
  validates :pseudo, presence: true, uniqueness: true
end
