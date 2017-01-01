class MakeArrowDirectionNotNull < ActiveRecord::Migration[5.0]
  def change
    Connection.connection.execute("UPDATE connections SET arrow_direction = 'down' WHERE 1=1")

    change_column_null :connections, :arrow_direction, false
  end
end
