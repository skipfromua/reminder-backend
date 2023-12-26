class AddSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, null: false
      t.string :chat_id, null: false
      t.string :source, null: false

      t.timestamps
    end
  end 
end
