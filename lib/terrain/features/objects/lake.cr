require "../../base"
require "./modules/blobby_things"

module Terrain
  class Lake < Base
    include BlobbyThings

    def initialize(rows = Random.rand(15), cols = Random.rand(30))
      super(rows, cols)
      populate(Terrain::Water.new)
    end
  end
end
