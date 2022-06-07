class ChangeNotificationsFieldsType < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :start_notifying, :string
    remove_column :notifications, :notification_time, :time

    add_column :notifications, :enabled, :boolean, default: true, null: false
    add_column :notifications, :start_notifying_days_before, :integer, default: 1, null: false
    add_column :notifications, :notifying_at, :string, array: true, default: []
  end
end
