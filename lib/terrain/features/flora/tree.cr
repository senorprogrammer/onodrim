require "../../base"

module Terrain
  class Tree < Base

    def symbol
      ["\u2912"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:green, :light_green].sample
      }
    end

  end
end
