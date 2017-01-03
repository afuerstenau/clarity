class Connection < ApplicationRecord
  belongs_to :next_component, :class_name => "Component", :optional  => true
  validates :arrow_direction, presence: true

  enum arrow_direction: [ :arrow_up, :arrow_down]
  def to_s
    self.identifier
  end
end
