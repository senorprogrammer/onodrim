require "../type"

module Terrain
  class Rock < Type

    def initialize
      super
    end

    def symbol
      ["\u2738", "\u272A"].sample
    end

    def color
      @color || {
                  back: [:black].sample,
                  fore: [:dark_gray, :light_gray].sample
                }
    end

  end
end

