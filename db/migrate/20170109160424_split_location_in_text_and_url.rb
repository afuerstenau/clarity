class SplitLocationInTextAndUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :components, :location_link, :string
  end
end
