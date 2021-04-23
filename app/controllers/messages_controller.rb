class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to item_path(@message.item)
    else
      @item = @message.item
      @messages = @item.messages
      render "items/show"
    end
  end

  private
  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
