class Memorie < ApplicationRecord
  belongs_to :reward

  validates :name, :content, :date, presence: true
end
