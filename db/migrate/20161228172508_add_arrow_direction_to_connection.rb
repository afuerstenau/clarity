class AddArrowDirectionToConnection < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :arrow_direction, :string
  end
end
