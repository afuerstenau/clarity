class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :notes
      t.string :repo

      t.timestamps
    end
  end
end
