require "../../base"
require "./modules/blobby_things"

module Terrain
  class Town < Base
    include BlobbyThings

    def initialize(width = Random.rand(8), height = Random.rand(6), depth = Random.rand(3))
      super(width, height, depth)
      populate(Terrain::House.new)
    end

  end
end
