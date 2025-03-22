class CreateTimeBlocks < ActiveRecord::Migration[8.0]
  def change
    create_table :time_blocks do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :completed
      t.text :reason
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
