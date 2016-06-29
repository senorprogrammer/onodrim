require "../../../../matrix"

module BlobbyStuff
  property matrix

  @height : Int32
  @width : Int32

  @matrix : ::Matrix

  def initialize(height : Int32, width : Int32)
    @height = height
    @width  = width

    @matrix = ::Matrix.new(height, width)
  end

  # -------------------- Private Methods --------------------

  private def populate(terrain : Terrain::Base)
    blob = Terrain::RandomizedBlob.new(terrain, @height, @width)
    @matrix = blob.matrix
  end
end
