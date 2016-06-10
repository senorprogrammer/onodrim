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

       add_buildings(1)
       add_mountains(3)
    end

    # -------------------- Private Methods --------------------

    # Populate it with the base layer
    private def add_base_layer(rows, cols)
      rows.times do |row|
        cols.times do |col|
          @grid.place_at(row, col, Terrain::Sand.new)
        end
      end
    end

    # Drop some features into the world
    private def add_features
      Random.rand((@grid.size + 5)).times do |x|
        terrain = Generators::Terrain.new.random()
        @grid.place_randomly(terrain)
      end
    end

    # Drop some lakes the world
    private def add_lakes(count : Int32)
      count.times do
        rows = Random.rand(15)
        cols = Random.rand(30)

        lake = Terrain::Aggregate.new(Terrain::Water.new, rows, cols)
        @grid.drop_randomly(lake)
      end
    end

    private def add_forests(count : Int32)
      count.times do
        rows = Random.rand(15)
        cols = Random.rand(30)

        forest = Terrain::Aggregate.new(Terrain::Tree.new, rows, cols)
        @grid.drop_randomly(forest)
      end
    end

    private def add_buildings(count : Int32)
      count.times do
        house = Terrain::House.new
        @grid.place_randomly(house)
      end
    end

    private def add_mountains(count : Int32)
      count.times do
        rows = Random.rand(3) + 2
        cols = Random.rand(5) + 2

        mountain = Terrain::Aggregate.new(Terrain::Rock.new, rows, cols)
        @grid.drop_randomly(mountain)
      end
    end
  end
end
