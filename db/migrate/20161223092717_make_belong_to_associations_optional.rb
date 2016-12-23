class MakeBelongToAssociationsOptional < ActiveRecord::Migration[5.0]
  def change
    drop_table :connections
    create_table :connections do |t|
      t.belongs_to :component, :top_component, foreign_key: true, optional: true
      t.belongs_to :component, :bottom_component, foreign_key: true, optional: true
      t.belongs_to :service, foreign_key: true
      t.string :identifier

      t.timestamps
    end
    drop_table :components
    create_table :components do |t|
      t.belongs_to :connection, :top_connection, foreign_key: true, optional: true
      t.belongs_to :connection, :bottom_connection, foreign_key: true, optional: true
      t.belongs_to :service, foreign_key: true
      t.string :name
      t.string :notes
      t.string :repo
      t.string :location

      t.timestamps
    end
  end
end
