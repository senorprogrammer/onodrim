class Matrix
  property grid, width, height

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

  def add_terrain(x, y, terrain)
    @grid[y][x] = terrain
  rescue IndexError
    # Can't place it there, don't care
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
