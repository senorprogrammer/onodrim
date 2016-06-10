require "../../base"

module Terrain
  class Shrub < Base

    def symbol
      ["*", "."].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:green].sample
      }
    end

  end
end
