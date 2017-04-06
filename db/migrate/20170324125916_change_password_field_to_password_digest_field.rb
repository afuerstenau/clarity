class ChangePasswordFieldToPasswordDigestField < ActiveRecord::Migration[5.0]
  def change
    remove_column :monitorings, :password
    add_column :monitorings, :password_digest, :digest, optional: true
  end
end
