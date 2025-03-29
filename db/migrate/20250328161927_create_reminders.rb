class CreateReminders < ActiveRecord::Migration[8.0]
  def change
    create_table :reminders do |t|
      t.references :habit, null: false, foreign_key: true
      t.datetime :reminder_time

      t.timestamps
    end
  end
end
