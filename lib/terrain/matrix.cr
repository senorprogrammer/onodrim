module Terrain
  class Matrix
    property grid

    def initialize(width, height)
      @grid = [] of Array(Terrain::Type)

      height.times do |h|
        row = [] of Terrain::Type

        (0...width).each { |w| row << Terrain::Type.new }

        @grid << row
      end
    end

    def update(x, y, terrain)
      @grid[x][y] = terrain
    end

    def at(x, y)
      @grid[x][y]
    end

    def size
      @grid.size * @grid[0].size
    end

    def to_s
      grid_str = ""

      @grid.each do |row|
        row_str = ""

        row.each do |col|
          row_str += col.symbol.colorize.fore(col.color).to_s
        end

        grid_str += row_str + "\n"
      end

      grid_str
    end

  end
end
