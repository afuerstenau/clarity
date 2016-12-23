class Component < ApplicationRecord
  belongs_to :next_connection, :class_name => "Connection", :optional => true

  def to_s
    self.name
  end
end
