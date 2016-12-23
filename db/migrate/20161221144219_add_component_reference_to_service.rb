class AddComponentReferenceToService < ActiveRecord::Migration[5.0]
  def up
    add_column :services, :component, :has_one
  end

  def down
    remove_column :services, :component
  end
end
