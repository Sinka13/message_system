class ChatsController < ApplicationController
  layout 'front'
  before_action :authenticate_user!

  def create
    if Chat.between(params[:sender_id],params[:resipient_id]).present?
       @chat = Chat.between(params[:sender_id],params[:resipient_id]).first
    else
       @chat = Chat.create!(chat_params)
    end
    if params[:message].present?
      message = @chat.messages.build(message_params.merge(user_id: current_user.id))
      message.save
    end
    redirect_to chats_path(chat: @chat.id)
  end

  def index
    @chats = Chat.involving(current_user).includes(:messages)
    @users = User.where.not(id: current_user.id)
    if params[:chat].present?
      chat = Chat.find_by_id params[:chat]
      chat.messages.unread(current_user).update_all(is_new: false)
    end
  end

  def read_messages
    chat = Chat.find_by_id params[:chat_id]
    chat.messages.unread(current_user).update_all(is_new: false)
  end


  private
  def chat_params
    params.permit(:sender_id,:resipient_id)
  end
  def message_params
    params.require(:message).permit(:description)
  end
end
