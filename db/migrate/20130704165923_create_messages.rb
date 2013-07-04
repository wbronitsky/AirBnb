class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.text :message
      t.boolean :read

      t.timestamps
    end
  end
end
