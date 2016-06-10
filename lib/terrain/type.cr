module Terrain
  class Type
    property color

    def symbol
      raise "Sub-class must implement #symbol."
    end

    def color=(hash : Hash(Symbol, Symbol))
      @color = hash
    end

    def color
      raise "Sub-class must implement #color."
    end

    # Returns the symbol wrapped in ANSI color codes
    def to_s
      symbol.colorize.fore(color[:fore]).back(color[:back]).to_s
    end
  end
end
