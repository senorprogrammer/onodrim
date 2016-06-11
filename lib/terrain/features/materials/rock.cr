require "../../base"

module Terrain
  class Rock < Base

    def symbol
      ["\u2756"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:dark_gray].sample
      }
    end

  end
end

