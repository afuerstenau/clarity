class Service < ApplicationRecord
  has_one :first_connection, :class_name => "Connection"

  def to_s
    self.name
  end
end
