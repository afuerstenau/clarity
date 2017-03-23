class SwitchForeignKeyFromMonitoringToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :monitoring, :string, optional: true
    remove_column :monitorings, :service
  end
end
