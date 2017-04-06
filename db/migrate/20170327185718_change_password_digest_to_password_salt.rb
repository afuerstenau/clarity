class ChangePasswordDigestToPasswordSalt < ActiveRecord::Migration[5.0]
  def change
    remove_column :monitorings, :password_digest
    add_column :monitorings, :password, :string, optional: true
    add_column :monitorings, :salt, :string, optional: true
  end
end
