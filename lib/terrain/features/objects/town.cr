require "../../base"
require "./modules/blobby_things"

module Terrain
  class Town < Base
    include BlobbyThings

    def initialize(rows = Random.rand(6), cols = Random.rand(8))
      super(rows, cols)
      populate(Terrain::House.new)
    end

  end
end
