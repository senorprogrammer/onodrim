require "../../../../matrix"

module BlobbyThings
  property matrix

  @width  : Int32
  @height : Int32
  @depth  : Int32

  @matrix : ::Matrix

  def initialize(width, height, depth)
    @width  = width
    @height = height
    @depth  = depth

    @matrix = ::Matrix.new(0, 0, 0)
  end

  # -------------------- Private Methods --------------------

  private def populate(terrain : Terrain::Base)
    blob = Terrain::RandomizedBlob.new(terrain, @width, @height, @depth)
    @matrix = blob.matrix.dup
  end
end
