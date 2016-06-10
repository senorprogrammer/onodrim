require "../../base"

module Terrain
  class House < Base

    def symbol
      ["\u2302", "\u26EA"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:red].sample,
      }
    end

    def style
      [:bold, :bright, :underline]
    end

  end
end
