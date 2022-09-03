class CreateOpUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :op_units do |t|
      t.integer :operation_id
      t.integer :unit_id
      t.boolean :is_enabled, null: false, default: true

      t.timestamps
    end
  end
end
