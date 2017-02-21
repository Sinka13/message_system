class Chat < ApplicationRecord
  belongs_to :sender, foreign_key: :resipient_id, class_name: 'User'
  belongs_to :resipient, foreign_key: :resipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy
  scope :new_messages, -> (user) { where.not("messages.user_id = ?",  user.id).where("messages.is_new =?", true)}

  scope :involving, -> (user) do
    where("chats.sender_id =? OR chats.resipient_id =?",user.id,user.id)
  end

  scope :between, -> (sender_id,resipient_id) do
    where("(chats.sender_id = ? AND chats.resipient_id =?) OR (chats.sender_id = ? AND chats.resipient_id =?)", sender_id,resipient_id, resipient_id, sender_id)
  end
end
