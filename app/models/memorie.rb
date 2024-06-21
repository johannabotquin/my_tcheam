class Memorie < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :content, presence: true
  validates :date, presence: true
end
