module Generators
  class Terrain

    def initialize
    end

    def random
      klass = [
        Terrain::Rock,
        Terrain::Shrub,
        Terrain::Tree,
      ].sample

      klass.new
    end
  end
end
