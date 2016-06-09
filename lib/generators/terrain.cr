module Generators
  class Terrain

    def initialize
    end

    def random
      klass = [
        Terrain::Rock,
        Terrain::Shrub,
        Terrain::Tree,
        Terrain::Water,
      ].sample

      klass.new
    end
  end
end
