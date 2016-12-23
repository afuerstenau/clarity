class CleanupComponentReferencesInConnection < ActiveRecord::Migration[5.0]
  def up
    drop_table :connections
    create_table :connections do |t|
      t.references :component,  :source_component, foreign_key: true
      t.references :component, :destination_component, foreign_key: true
      t.string :identifier

      t.timestamps
    end
  end
end
