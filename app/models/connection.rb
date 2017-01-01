class Connection < ApplicationRecord
  belongs_to :next_component, :class_name => "Component", :optional  => true
  validates :arrow_direction, presence: true

  def to_s
    self.identifier
  end
end
