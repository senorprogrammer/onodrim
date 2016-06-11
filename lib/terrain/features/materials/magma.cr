require "../../base"
require "./modules/fluid"

module Terrain
  class Magma < Base
    include Fluid

    def symbol
      ["\u2B45", "\u2B46"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:red].sample
      }
    end

    def style
      depth >= DEEP_DEPTH ? [:dim] : [] of Symbol
    end
  end
end

