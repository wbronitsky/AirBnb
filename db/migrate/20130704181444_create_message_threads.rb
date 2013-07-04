class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|

      t.timestamps
    end
  end
end
