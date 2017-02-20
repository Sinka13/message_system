module ApplicationHelper
  def set_resipient(chat)
    current_user == chat.resipient ? chat.sender : chat.resipient
  end
#TODO temporary solution   @chats.joins(:messages).group('id').count
  def new_messages(chats, user)
    count = 0
    chats.each do |chat|
      count += chat.messages.unread(user).count
    end
    return count
  end
end
