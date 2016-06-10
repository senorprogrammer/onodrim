require "../type"

module Terrain
  class Water < Type

    def symbol
      ["\u2B45", "\u2B46"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:blue].sample
      }
    end
  end
end
