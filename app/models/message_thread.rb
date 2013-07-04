class MessageThread < ActiveRecord::Base
  attr_accessible :owner_id, :requester_id
  has_many :messages, foreign_key: :message_thread_id
  belongs_to :user1, class_name: "User", foreign_key: :owner_id
  belongs_to :user2, class_name: "User", foreign_key: :requester_id
end
