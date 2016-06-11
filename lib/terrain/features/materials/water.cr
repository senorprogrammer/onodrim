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
      empty_arr = [] of Symbol
      return empty_arr unless depth

      (@depth || 1) > 4 ? [:bold] : empty_arr
    end

  end
end
