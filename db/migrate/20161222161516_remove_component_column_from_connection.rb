class RemoveComponentColumnFromConnection < ActiveRecord::Migration[5.0]
  def change
    remove_column :connections, :component
  end
end
