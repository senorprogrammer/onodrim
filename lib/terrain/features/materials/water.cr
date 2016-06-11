require "../../base"
require "./modules/fluid"

module Terrain
  class Water < Base
    include Fluid


    # -------------------- Display --------------------

    def symbol
      ["\u2248"].sample
    end

    def color
      {
        back: [:black].sample,
        fore: [:blue].sample
      }
    end

    def style
      depth >= DEEP_DEPTH ? [:bold] : [] of Symbol
    end

  end
end
