class Service < ApplicationRecord
  belongs_to :first_connection, :class_name => "Connection", :optional  => true
  belongs_to :monitoring, :optional  => true

  def to_s
    self.name
  end
end
