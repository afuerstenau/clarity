class AddConnectionsToComponent < ActiveRecord::Migration[5.0]
  def change
    drop_table :components
    create_table :components do |t|
      t.references :connection, :top_connection, foreign_key: true
      t.references :connection, :bottom_connection, foreign_key: true
      t.belongs_to :service, foreign_key: true
      t.string :name
      t.string :notes
      t.string :repo
      t.string :location

      t.timestamps
    end
  end
end
