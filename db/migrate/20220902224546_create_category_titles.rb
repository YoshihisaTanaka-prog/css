class CreateCategoryTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :category_titles do |t|
      t.integer :category_id
      t.integer :title_id
      t.boolean :is_enabled

      t.timestamps
    end
  end
end
