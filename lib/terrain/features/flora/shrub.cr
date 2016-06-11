require "../../base"

module Terrain
  class Shrub < Base

    def symbol
      ["\u2913"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:green, :light_green].sample
      }
    end

  end
end
