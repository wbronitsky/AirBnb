class MessageThreadsController < ApplicationController
  def index
    @threads = MessageThread.where(owner_id: current_user.id)
    @threads += MessageThread.where(requester_id: current_user.id)
    @threads.sort_by! do |thread|
      thread.created_at
    end
  end
end
