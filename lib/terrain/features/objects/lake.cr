require "../../base"
require "./modules/blobby_things"

module Terrain
  class Lake < Base
    include BlobbyThings

    def initialize(width = Random.rand(30), height = Random.rand(15), depth = Random.rand(30))
      super(width, height, depth)
      populate(Terrain::Water.new)
    end
  end
end
