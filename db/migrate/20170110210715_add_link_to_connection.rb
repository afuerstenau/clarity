class AddLinkToConnection < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :identifier_link, :string
  end
end
