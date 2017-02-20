class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates_presence_of :description, :chat_id, :user_id
  scope :unread, ->(user) { where("user_id IS NOT #{user.id}", is_new: true) }
end
