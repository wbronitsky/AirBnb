class Message < ActiveRecord::Base
  attr_accessible :message, :read, :reciever_id, :sender_id, :title, :message_thread_id

  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :reciever, class_name: "User", foreign_key: :reciever_id
  belongs_to :message_thread 
end
