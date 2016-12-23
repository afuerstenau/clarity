class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.belongs_to :component, foreign_key: true, as: :destination_component
      t.belongs_to :component, foreign_key: true, as: :source_component
      t.string :identifier

      t.timestamps
    end
  end
end
