class Connection < ApplicationRecord
  belongs_to :top_component, :class_name => "Component", :optional  => true
  belongs_to :bottom_component, :class_name => "Component", :optional  => true
end