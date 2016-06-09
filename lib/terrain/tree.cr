require "./type"

module Terrain
  class Tree < Type

    def initialize
      super
    end

    def symbol
      ["t", "T"].sample
    end

    def color
      :green
    end

  end
end
