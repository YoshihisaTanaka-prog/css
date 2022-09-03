class CreateNormalTags < ActiveRecord::Migration[7.0]
  def change
    create_table :normal_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
