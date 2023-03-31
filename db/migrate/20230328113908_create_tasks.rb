class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :due_date
      t.string :status, null: false, default: 0
      t.integer :priority, null: false, default: 0
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
