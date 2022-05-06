class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :event, null: false
      t.string :start_notifying, null: false
      t.time :notification_time, null: false

      t.timestamps
    end
  end
end
