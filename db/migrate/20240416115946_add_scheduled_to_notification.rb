class AddScheduledToNotification < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :schedueld, :boolean, default: false, null: false 
  end
end
