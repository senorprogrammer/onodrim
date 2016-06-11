require "../../../matrix"

module BlobbyStuff
  property matrix

  @rows : Int32
  @cols : Int32

  @matrix : Terrain::Matrix

  def initialize(rows : Int32, cols : Int32)
    @rows = rows
    @cols = cols

    @matrix = Terrain::Matrix.new(rows, cols)
  end

  # -------------------- Private Methods --------------------

  private def populate(terrain : Terrain::Base)
    blob = Terrain::RandomizedBlob.new(terrain, @rows, @cols)
    @matrix = blob.matrix
  end
end
