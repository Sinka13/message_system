class MessagesController < ApplicationController
  def create
    chat = Chat.find_by_id(params[:chat_id])
    message = chat.messages.build(message_params.merge(is_new: true, user_id: current_user.id))
    redirect_back fallback_location: root_path if message.save
  end

  private

  def message_params
    params.permit(:description)
  end
end
