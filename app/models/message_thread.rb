class MessageThread < ActiveRecord::Base
  attr_accessible :owner_id, :requester_id
  has_many :message_thread_joins, foreign_key: :thread_id
  has_many :messages, through: :message_thread_joins, source: :message
  belongs_to :user1, class_name: "User", foreign_key: :owner_id
  belongs_to :user2, class_name: "User", foreign_key: :requester_id
end
