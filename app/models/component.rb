class Component < ApplicationRecord
  belongs_to :top_connection, :class_name => "Connection", :optional => true
  belongs_to :bottom_connection, :class_name => "Connection", :optional => true

  def to_s
    self.name
  end
end
