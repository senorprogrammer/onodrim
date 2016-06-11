require "../../base"
require "./modules/fluid"

module Terrain
  class Water < Base
    include Fluid

    property depth


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
      [:bold]
    end

  end
end
