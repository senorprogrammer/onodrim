require "../type"

module Terrain
  class House < Type

    def symbol
      ["\u2302"].sample
    end

    def color
      @color || {
                  back: [:black].sample,
                  fore: [:cyan, :light_cyan].sample
                }
    end

  end
end
