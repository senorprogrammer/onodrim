module Generators
  class World
    property grid
    property name

    def initialize(name : String, width = 100, height = 100)
      @name = name
      @grid = Terrain::Matrix.new(width, height)

      height.times do |w|
        width.times do |h|
          @grid.update(w, h, Generators::Terrain.new.random)
        end
      end
    end
  end
end
