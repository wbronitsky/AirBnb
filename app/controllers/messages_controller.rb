class MessagesController < ApplicationController
  def index
    
  end

  def new
    @message = Message.new
  end

  def create
    if params[:thread] == "false"
      @thread = MessageThread.create!(owner_id: current_user.id,
                                      requester_id: params[:message][:reciever_id])
    else
      @thread = MessageThread.find(params[:thread].to_i)
    end

    @message = @thread.messages.build(params[:message])
    @message.sender_id = current_user.id

    if @message.save
      @thread.save

      render json: @message
    else
      render json: @message, status: 422
    end
  end

end
