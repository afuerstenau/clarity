class AddConnectionBetweenServiceAndConnection < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :first_connection, :integer
  end
end
