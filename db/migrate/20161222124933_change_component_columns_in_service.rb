class ChangeComponentColumnsInService < ActiveRecord::Migration[5.0]
  def change
    remove_column :connections, :destination_component
    remove_column :connections, :source_component
    add_column :connections, :source_component, :has_one
    add_column :connections, :destination_component, :has_one
  end
end
