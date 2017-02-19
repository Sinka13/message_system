class Chat < ApplicationRecord
  belongs_to :sender, foreign_key: :recepient_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recepient_id, class_name: 'User'

  has_many :messages, dependent: :destroy
end
