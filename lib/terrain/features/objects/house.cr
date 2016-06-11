require "../../base"

module Terrain
  class House < Base

    def symbol
      ["\u2302"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:white].sample,
      }
    end

    def style
      [:bold, :bright]
    end

  end
end
