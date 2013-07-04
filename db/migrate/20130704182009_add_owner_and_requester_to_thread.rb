class AddOwnerAndRequesterToThread < ActiveRecord::Migration
  def change
    add_column :message_threads, :owner_id, :integer
    add_column :message_threads, :requester_id, :integer
  end
end
