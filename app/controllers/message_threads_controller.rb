class MessageThreadsController < ApplicationController
  def index
    @threads = MessageThread.includes(:messages).where(owner_id: current_user.id)
    @threads += MessageThread.includes(:messages).where(requester_id: current_user.id)
    @threads.sort_by! do |thread|
      thread.created_at
    end
    @messages = @threads.map {|thread| thread.messages}
  end

  def show
    @thread = MessageThread.find(params[:id])
    @messages = Message.includes(:sender)
                       .includes(:reciever)
                       .where(message_thread_id: params[:id])
    @messages.each do |message|
      if current_user.id == message.reciever_id
        message.read = true
        message.save!
      end
    end
    render json: [@thread, @messages]
  end
end
