require "../../base"
require "./modules/blobby_stuff"

module Terrain
  class Town < Base
    include BlobbyStuff

    def initialize(rows = Random.rand(6), cols = Random.rand(8))
      super(rows, cols)
      populate(Terrain::House.new)
    end

  end
end
