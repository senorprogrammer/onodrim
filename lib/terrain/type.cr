module Terrain
  class Type

    def initialize
    end

    def symbol
      raise "Sub-class must implement #symbol."
    end

    def color
      raise "Sub-class must implement #color."
    end

  end
end
