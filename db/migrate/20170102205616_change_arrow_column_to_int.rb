class ChangeArrowColumnToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :connections, :arrow_direction, :integer
  end
end
