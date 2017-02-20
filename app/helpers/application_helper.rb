module ApplicationHelper
  def set_resipient(chat)
    current_user == chat.resipient ? chat.sender : chat.resipient
  end

end
