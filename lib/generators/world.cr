module Generators
  class World
    property grid
    property name

    def initialize(name : String, cols = 100, rows = 100)
      @name = name

      # Generate the world matrix
      @grid = Terrain::Matrix.new(rows, cols)

      # Populate it with the base layer
      rows.times do |row|
        cols.times do |col|
          @grid.update(row, col, Terrain::Sand.new)
        end
      end

      # Drop some features into the world
      Random.rand((@grid.size + 5)).times do |x|
        terrain = Generators::Terrain.new.random()
        @grid.to_random_location(terrain)
      end
    end
  end
end
