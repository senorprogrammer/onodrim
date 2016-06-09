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

end

