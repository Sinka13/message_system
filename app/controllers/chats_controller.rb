class ChatsController < ApplicationController
  layout 'front'
  before_action :authenticate_user!

  def create
    if Chat.between(params[:sender_id],params[:resipient_id]).present?
       @chat = Chat.between(params[:sender_id],params[:resipient_id]).first
    else
       @chat = Chat.create!(chat_params)
    end
    redirect_to chat_path(@chat)
  end

  def show
    @chat = Chat.includes(:messages).find_by_id(params[:id])
    @chats = Chat.involving(current_user).includes(:messages)
  end

  private
  def chat_params
    params.permit(:sender_id,:resipient_id)
  end

end
