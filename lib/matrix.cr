class Matrix
  property grid, width, height, depth

  def initialize(width : Int32 = 100, height : Int32 = 100, depth : Int32 = 100)
    @width  = width
    @height = height
    @depth  = depth

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
    true
  rescue IndexError
    # Can't place it there, don't care
    false
  end

  # -------------------- Instance Methods --------------------

  def at(x, y)
    @grid[y][x]
  rescue IndexError
    nil
  end

  def size
    @width * @height * @depth
  end

end
