class Memorie < ApplicationRecord
  belongs_to :team
  # validates :name, :content, :date, presence: true
end
