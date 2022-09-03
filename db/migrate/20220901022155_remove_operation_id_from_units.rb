class RemoveOperationIdFromUnits < ActiveRecord::Migration[7.0]
  def change
    remove_column :units, :operation_id, :integer
  end
end
