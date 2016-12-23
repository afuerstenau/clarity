class Service < ApplicationRecord
  belongs_to :first_connection, :class_name => "Connection"

  def to_s
    self.name
  end
end
