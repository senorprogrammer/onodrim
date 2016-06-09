module Terrain
  class Matrix
    property grid

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

    def update(col, row, terrain)
      @grid[col][row] = terrain
    end

    def to_random_location(terrain)
      col = Random.rand(@rows)
      row = Random.rand(@cols)

      update(col, row, terrain)
    end

    def at(col, row)
      @grid[col][row]
    end

    def size
      @grid.size * @grid[0].size
    end

    def to_s
      grid_str = ""

      @grid.each do |row|
        row_str = ""

        row.each do |col|
          row_str += col.symbol.colorize.fore(col.color[:fore]).back(col.color[:back]).to_s
        end

        grid_str += row_str + "\n"
      end

      grid_str
    end

  end
end
