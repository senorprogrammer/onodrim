require "../../base"
require "./modules/blobby_things"

module Terrain
  class Mountain < Base
    include BlobbyThings

    def initialize(width = (Random.rand(12) + 2), height = Random.rand(6) + 2, depth = Random.rand(30))
      super(width, height, depth)
      populate(Terrain::Rock.new)
    end

  end
end

