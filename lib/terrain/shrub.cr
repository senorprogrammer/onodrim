require "./type"

module Terrain
  class Shrub < Type

    def initialize
      super
    end

    def symbol
      ["*", "."].sample
    end

    def color
      :green
    end

  end
end
