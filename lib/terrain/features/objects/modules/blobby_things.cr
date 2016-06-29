require "../../../../matrix"

module BlobbyThings
  property matrix

  @height : Int32
  @width : Int32

  @matrix : ::Matrix

  def initialize(height : Int32, width : Int32)
    @height = height
    @width  = width

    @matrix = ::Matrix.new(0, 0)
  end

  # -------------------- Private Methods --------------------

  private def populate(terrain : Terrain::Base)
    blob = Terrain::RandomizedBlob.new(terrain, @height, @width)
    @matrix = blob.matrix.dup
  end
end
