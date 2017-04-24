class Monitoring < ApplicationRecord
  
  class << self
      def types
        %w(Icinga Nagios)
      end
    end
end
