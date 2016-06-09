require "../type"

module Terrain
  class Shrub < Type

    def initialize
      super
    end

    def symbol
      ["*", "."].sample
    end

    def color
      @color || {
                  back: [:black].sample,
                  fore: [:green].sample
                }
    end

  end
end
