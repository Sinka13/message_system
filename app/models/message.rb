class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates_presence_of :description, :chat_id, :user_id
end
