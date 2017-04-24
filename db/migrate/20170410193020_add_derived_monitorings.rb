class AddDerivedMonitorings < ActiveRecord::Migration[5.0]
  def change
      add_column :monitorings, :type, :string, optional: true
      Connection.connection.execute("UPDATE monitorings SET type = 'icinga' WHERE 1=1")
      change_column_null :monitorings, :type, false
  end
end
