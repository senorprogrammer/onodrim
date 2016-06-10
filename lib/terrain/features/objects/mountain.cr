require "../../base"
require "../../matrix"

module Terrain
  class Mountain
    property matrix

    @matrix : Terrain::Matrix

    def initialize(rows = (Random.rand(3) + 2), cols = (Random.rand(5) + 2))
      blob = Terrain::RandomizedBlob.new(Terrain::Rock.new, rows, cols)
      @matrix = blob.matrix
    end

  end
end

