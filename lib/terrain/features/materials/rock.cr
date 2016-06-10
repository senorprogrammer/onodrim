require "../../base"

module Terrain
  class Rock < Base

    def symbol
      ["\u2738", "\u272A"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:dark_gray].sample
      }
    end

  end
end

