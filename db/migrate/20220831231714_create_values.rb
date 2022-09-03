class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.integer :original_tag_id
      t.integer :title_id
      t.string :value

      t.timestamps
    end
  end
end
