module Terrain
  class Type
    property color

    def initialize
    end

    def symbol
      raise "Sub-class must implement #symbol."
    end

    def color=(hash : Hash(Symbol, Symbol))
      @color = hash
    end

    def color
      raise "Sub-class must implement #color."
    end

  end
end
