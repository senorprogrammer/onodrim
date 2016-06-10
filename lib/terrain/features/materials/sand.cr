require "../../base"

module Terrain
  class Sand < Base

    def symbol
      "\u2317"
    end

    def color
      {
        back: :black,
        fore: :light_yellow
      }
    end

  end
end
