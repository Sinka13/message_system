module ChatsHelper
  def message_class(message)
    message.user == current_user ? "right" : "left"
  end
end
