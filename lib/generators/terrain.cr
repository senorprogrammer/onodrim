module Generators
  class Terrain

    def initialize
    end

    def random
      klass = [
        Terrain::House,
        Terrain::Rock,
        Terrain::Shrub,
        Terrain::Tree,
        Terrain::Water,
        Terrain::Sand
      ].sample

      klass.new
    end
  end
end
