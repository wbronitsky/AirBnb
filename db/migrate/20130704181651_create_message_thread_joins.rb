class CreateMessageThreadJoins < ActiveRecord::Migration
  def change
    create_table :message_thread_joins do |t|
      t.integer :message_id
      t.integer :thread_id

      t.timestamps
    end
  end
end
