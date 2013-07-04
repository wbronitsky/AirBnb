class AddMessageThreadIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :message_thread_id, :integer
  end
end
