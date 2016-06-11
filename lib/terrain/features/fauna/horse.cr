require "../../base"

module Terrain
  class Horse < Base

    def symbol
      ["H"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:yellow].sample,
      }
    end

    def style
      [:bright]
    end

  end
end
