class AddIdToMonitoringField < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :monitoring_id, :string, optional: true
    remove_column :services, :service
  end
end
