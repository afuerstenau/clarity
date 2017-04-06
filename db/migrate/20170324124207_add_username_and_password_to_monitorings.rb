class AddUsernameAndPasswordToMonitorings < ActiveRecord::Migration[5.0]
  def change
    add_column :monitorings, :username, :string, optional: true
    add_column :monitorings, :password, :digest, optional: true
  end
end
