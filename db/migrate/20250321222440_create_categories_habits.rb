class CreateCategoriesHabits < ActiveRecord::Migration[8.0]
  def change
    create_table :categories_habits do |t|
      t.references :habit, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
