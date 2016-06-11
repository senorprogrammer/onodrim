require "../../base"

module Terrain
  class Snow < Base

    def symbol
      ["\u2744"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:white].sample
      }
    end

    def style
      [:bright]
    end
  end
end

