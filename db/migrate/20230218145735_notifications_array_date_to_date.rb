class NotificationsArrayDateToDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :notifying_at, :string, array: true, default: []

    add_column :notifications, :notify_at, :time
  end
end
