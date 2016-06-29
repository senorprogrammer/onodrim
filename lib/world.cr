class World
  property name
  property matrix

  def initialize(name : String, matrix : ::Matrix)
    @name   = name
    @matrix = matrix
  end

  def add_terrain(x : Int32, y : Int32, terrain : Terrain::Base)
    @matrix.add_terrain(x, y, terrain)
  end

  def add_object(x : Int32, y : Int32, terrain_obj : Terrain::Base)
    terrain_obj.matrix.grid.each_with_index do |terrain_row, tr_idx|
      terrain_row.each_with_index do |terrain, t_idx|
        next if terrain.is_a? Terrain::Null
        add_terrain((x + t_idx), (y + tr_idx), terrain)
      end
    end
  end

  def random_location
    x = Random.rand(@matrix.width)
    y = Random.rand(@matrix.height)

    ::Location.new(x, y)
  end
end
