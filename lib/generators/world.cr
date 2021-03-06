module Generators
  class World
    property world

    def initialize(name : String, width : Int32 , height : Int32, depth : Int32)
      @world = ::World.new(name, ::Matrix.new(width, height, depth))

      add_base_layer(Terrain::Sand.new, height, width)

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
      rows.times do |y|
        cols.times { |x| @world.add_terrain(x, y, terrain_sample.class.new) }
      end
    end

    private def drop_some(terrain_sample : Terrain::Base, count : Int32)
      count.times do
        loc = @world.random_location
        @world.add_object(loc.x, loc.y, terrain_sample.class.new)
      end
    end

    private def place_some(terrain_sample : Terrain::Base, count : Int32)
      count.times do
        loc = @world.random_location
        @world.add_terrain(loc.x, loc.y, terrain_sample.class.new)
      end
    end
  end
end
