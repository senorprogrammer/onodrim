require "../type"

module Terrain
  class Tree < Type

    def symbol
      ["\u2912", "\u2B06"].sample
    end

    def color
      @color || {
                  back: [:black].sample,
                  fore: [:green, :light_green].sample
                }
    end

  end
end
