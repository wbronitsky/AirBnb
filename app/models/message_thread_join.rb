class MessageThreadJoin < ActiveRecord::Base
  attr_accessible :message_id, :thread_id

  belongs_to :message
  belongs_to :thread, class_name: "MessageThread", foreign_key: :thread_id
end
