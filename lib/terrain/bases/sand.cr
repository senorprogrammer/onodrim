require "../type"

module Terrain
  class Sand < Type

    def initialize
      super
    end

    def symbol
      "\u2317"
    end

    def color
      @color || {
                  back: :black,
                  fore: :light_yellow
                }
    end

  end
end
