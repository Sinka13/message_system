module ApplicationHelper
  def set_resipient(conversation)
    current_user == conversation.resipient ? conversation.sender : conversation.resipient
  end
end
