class AddConnectionBetweenServiceAndMonitoring < ActiveRecord::Migration[5.0]
  def change
    add_column :monitorings, :service, :string
  end
end
