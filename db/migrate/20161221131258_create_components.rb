class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.belongs_to :service, foreign_key: true
      t.string :name
      t.string :notes
      t.string :repo
      t.string :location

      t.timestamps
    end
  end
end
