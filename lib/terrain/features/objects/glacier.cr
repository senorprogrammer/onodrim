require "../../base"
require "./modules/blobby_stuff"

module Terrain
  class Glacier < Base
    include BlobbyStuff

    def initialize(rows = Random.rand(15), cols = Random.rand(30))
      super(rows, cols)
      populate(Terrain::Snow.new)
    end

  end
end

