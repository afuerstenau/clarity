class SwitchFromComponentToConnection < ActiveRecord::Migration[5.0]
  def change
    remove_column :components, :service_id
    remove_column :components, :connection_id
    remove_column :connections, :component_id
    
  end
end
