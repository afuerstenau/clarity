class AddIdToColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :first_connection
    add_column :services, :first_connection_id, :integer
  end
end
