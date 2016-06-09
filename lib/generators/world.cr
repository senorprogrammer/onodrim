module Generators
  class World
    property grid

    def initialize(name : String, width = 100, height = 100)
      @name = name
      @grid = Matrix.new(width, height)

      height.times do |w|
        width.times do |h|
          terrain = Generators::Terrain.new.random
          @grid.update(w, h, terrain)
        end
      end
    end
  end
end
