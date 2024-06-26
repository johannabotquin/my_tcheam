class ChatroomUser < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :user_id, :chatroom_id, presence: true
  validates :user_id, uniqueness: { scope: :chatroom_id }
end
