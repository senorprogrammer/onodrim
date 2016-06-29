module Terrain
  class Matrix
    property grid

    def initialize(height : Int32, width : Int32)
      @height = height
      @width = width

      @grid = [] of Array(Terrain::Base)

      @height.times do |_|
        row = [] of Terrain::Base

        (0...width).each { |x| row << Terrain::Null.new }

        @grid << row
      end
    end

    # -------------------- Placing things onto the grid --------------------

    def place_at(y, x, terrain)
      @grid[y][x] = terrain
    rescue IndexError
      # Can't place it there, don't care
    end

    # TODO: Remove everything from here down from this class

    def place_randomly(terrain)
      x = Random.rand(@width)
      y = Random.rand(@height)

      place_at(y, x, terrain)
    end

    # Use this to drop large elements onto the matric (for
    # instance, a body of water, or a forest)
    #
    # FIXME: Row, Col should be the center of the object, not the top-left

    def drop_at(y, x, terrain_body)
      terrain_body.matrix.grid.each_with_index do |terrain_row, tr_idx|
        terrain_row.each_with_index do |terrain, t_idx|
          next if terrain.is_a? Terrain::Null
          place_at((y + tr_idx), (x + t_idx), terrain)
        end
      end
    end

    def drop_randomly(terrain_body)
      x = Random.rand(@width)
      y = Random.rand(@height)

      drop_at(y, x, terrain_body)
    end

    # -------------------- Instance Methods --------------------

    def at(y, x)
      @grid[y][x]
    rescue IndexError
      nil
    end

    def size
      @width * @height
    end

  end
end
