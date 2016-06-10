module Terrain
  class Matrix
    property grid
    property rows

    def initialize(rows : Int32, cols : Int32)
      @rows = rows
      @cols = cols

      @grid = [] of Array(Terrain::Type)

      rows.times do |_|
        row = [] of Terrain::Type

        (0...cols).each { |col| row << Terrain::Type.new }

        @grid << row
      end
    end

    # -------------------- Placing things onto the grid --------------------

    def place_at(row, col, terrain)
      @grid[row][col] = terrain
    rescue IndexError
      # Can't place it there, don't care
    end

    def place_randomly(terrain)
      row = Random.rand(@rows)
      col = Random.rand(@cols)

      place_at(row, col, terrain)
    end

    # Use this to drop large elements onto the matric (for
    # instance, a body of water, or a forest)
    def drop_at(row, col, terrain_body)
      terrain_body.matrix.grid.each_with_index do |terrain_row, tr_idx|
        terrain_row.each_with_index do |terrain, t_idx|
          next if terrain.is_a? Terrain::Null
          place_at((row + tr_idx), (col + t_idx), terrain)
        end
      end
    end

    def drop_randomly(terrain_body)
      row = Random.rand(@rows)
      col = Random.rand(@cols)

      drop_at(row, col, terrain_body)
    end

    # -------------------- Instance Methods --------------------

    def at(row, col)
      @grid[row][col]
    rescue IndexError
      nil
    end

    def size
      @grid.size * @grid[0].size
    end

    def to_s
      @grid.reduce("") do |grid_acc, row|
        res = row.reduce("") do |row_acc, terrain|
          row_acc += terrain.to_s
        end

        grid_acc += res + "\n"
      end
    end

  end
end
