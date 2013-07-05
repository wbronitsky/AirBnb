class AddReadByFieldsToMessage < ActiveRecord::Migration
  def change
    drop_table :message_thread_joins
  end
end
