class RenameSubclassToCapitalIcinga < ActiveRecord::Migration[5.0]
  def change
    Connection.connection.execute("UPDATE monitorings SET type = 'Icinga' WHERE 1=1")
  end
end
