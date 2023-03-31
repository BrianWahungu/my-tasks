class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.integer :task_id
      t.datetime :reminder_date
      t.text :reminder_message

      t.timestamps
    end
  end
end
