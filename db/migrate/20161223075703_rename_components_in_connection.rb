class RenameComponentsInConnection < ActiveRecord::Migration[5.0]
  def change
    drop_table :connections
    create_table :connections do |t|
      t.references :component, :top_component, foreign_key: true
      t.references :component, :bottom_component, foreign_key: true
      t.string :identifier

      t.timestamps
    end
    remove_column :connections, :component
    remove_column :components, :connection
  end
end
