class Service < ApplicationRecord
  has_one :component

  def to_s
    self.name
  end
end
