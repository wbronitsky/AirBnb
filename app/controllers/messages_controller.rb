class MessagesController < ApplicationController
  def index
    
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.build(params[:message])

    if @message.save
      if params[:thread] == false
        @thread = MessageThread.find(params[:thread])
      else
        @thread = MessageThread.create!(owner_id: current_user.id,
                                    requester_id: params[:message][:reciever_id])
      end
      
      @thread.messages << @message

      render json: @message
    else
      render json: @message, status: 422
    end
  end

end
