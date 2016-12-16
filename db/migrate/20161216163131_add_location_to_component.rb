class AddLocationToComponent < ActiveRecord::Migration[5.0]
  def change
    add_column :components, :location, :string
  end
end
