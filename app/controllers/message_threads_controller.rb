class MessageThreadsController < ApplicationController
  def index
    @threads = MessageThread.where(owner_id: current_user.id)
    @threads += MessageThread.where(requester_id: current_user.id)
    @threads.sort_by! do |thread|
      thread.created_at
    end
  end

  def show
    @thread = MessageThread.find(params[:id])
    @messages = Message.includes(:sender)
                       .includes(:reciever)
                       .where(message_thread_id: params[:id])
    @messages.each do |message|
      message.read = true
      message.save!
    end
  end
end
