module Generators
  class World
    property grid
    property name

    def initialize(name : String, rows = 100, cols = 100)
      @name = name

      # Generate the world matrix
      @grid = Terrain::Matrix.new(rows, cols)

      add_base_layer(rows, cols)

      Random.rand(50).times do |rnd|
        add_lakes(1)
        add_forests(1)
      end

      add_mountains(3)
      add_buildings(1)
    end

    # -------------------- Private Methods --------------------

    # Populate it with the base layer
    private def add_base_layer(rows, cols)
      rows.times do |row|
        cols.times { |col| @grid.place_at(row, col, Terrain::Sand.new) }
      end
    end

    # Drop some lakes the world
    private def add_lakes(count : Int32)
      count.times do
        @grid.drop_randomly(Terrain::Lake.new)
      end
    end

    private def add_forests(count : Int32)
      count.times do
        @grid.drop_randomly(Terrain::Forest.new)
      end
    end

    private def add_buildings(count : Int32)
      count.times do
        @grid.place_randomly(Terrain::House.new)
      end
    end

    private def add_mountains(count : Int32)
      count.times do
        @grid.drop_randomly(Terrain::Mountain.new())
      end
    end
  end
end
