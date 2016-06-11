module Generators
  class World
    property grid
    property name

    def initialize(name : String, rows = 100, cols = 100)
      @name = name
      @grid = Terrain::Matrix.new(rows, cols)

      add_base_layer(Terrain::Sand.new, rows, cols)

      Random.rand(50).times do |rnd|
        drop_some(Terrain::Lake.new, 1)
        drop_some(Terrain::Forest.new, 1)
      end

      Random.rand(10).times do |rnd|
        drop_some(Terrain::Town.new, 1)

        place_some(Terrain::Horse.new, 1)
        place_some(Terrain::Boat.new, 1)
      end

      drop_some(Terrain::Mountain.new, 3)

      drop_some(Terrain::Lava.new, 1)    if (Random.rand(2) == 0)
      drop_some(Terrain::Glacier.new, 1) if (Random.rand(2) == 0)
    end

    # -------------------- Private Methods --------------------

    # Populate it with the base layer
    private def add_base_layer(terrain_sample : Terrain::Base, rows, cols)
      rows.times do |row|
        cols.times { |col| @grid.place_at(row, col, terrain_sample.class.new) }
      end
    end

    private def drop_some(terrain_sample : Terrain::Base, count : Int32)
      count.times do
        @grid.drop_randomly(terrain_sample.class.new)
      end
    end

    private def place_some(terrain_sample : Terrain::Base, count : Int32)
      count.times do
        @grid.place_randomly(terrain_sample.class.new)
      end
    end
  end
end
