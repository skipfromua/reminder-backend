class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.string :name, null: false, default: ''
      t.string :repeatable, null: false, default: 'none'
      t.date :date, null: false
      t.time :starts_at
      t.boolean :finished

      t.timestamps
    end
  end
end
