require "../../base"

module Terrain
  class Boat < Base

    def symbol
      ["\u256A"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:blue, :red, :green, :yellow, :magenta, :cyan].sample
      }
    end
  end
end

