require "../../base"
require "../../matrix"

module Terrain
  class Lake
    property matrix

    @matrix : Terrain::Matrix

    def initialize(rows = Random.rand(15), cols = Random.rand(30))
      blob = Terrain::RandomizedBlob.new(Terrain::Water.new, rows, cols)
      @matrix = blob.matrix
    end

  end
end
