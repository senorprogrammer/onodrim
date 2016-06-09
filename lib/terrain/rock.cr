require "./type"

module Terrain
  class Rock < Type

    def initialize
      super
    end

    def symbol
      ["•", "."].sample
    end

    def color
      [:dark_gray, :light_gray].sample
    end

  end
end

