class RemoveConnectionBetweenServiceAndComponent < ActiveRecord::Migration[5.0]
  def change
    drop_table :services
    create_table :services do |t|
      t.string :name

      t.timestamps
    end
    add_index :services, :name, unique: true
  end
end
