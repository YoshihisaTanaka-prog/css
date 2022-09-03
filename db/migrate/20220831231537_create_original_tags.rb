class CreateOriginalTags < ActiveRecord::Migration[7.0]
  def change
    create_table :original_tags do |t|
      t.integer :product_id
      t.string :name
      t.integer :parent_id, null: false, default: 0

      t.timestamps
    end
  end
end
