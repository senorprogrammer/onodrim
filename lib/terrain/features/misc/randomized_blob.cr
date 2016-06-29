require "../../base"

# The RandomizedBlob creates a large area of any other kind of terrain,
# with randomized edge shapes (in theory), hence the 'blob'
#
# Examples:
#
#   Lake: Terrain::RandomizedBlob.new(Terrain::Water.new, 20, 20)
#   Town: Terrain::RandomizedBlob.new(Terrain::House.new, 15, 30)
#
# (The terrain type being passed in has to be instantiated because I don't
#  yet know how to tell Crystal to accept a class as a parameter)
#
# Ideally, wrap this in a helper class that encapsulates the main concept.
# See Terrain::Lake and Terrain::Town for details.
#
module Terrain
  class RandomizedBlob
    property matrix

    def initialize(terrain_sample : Terrain::Base, height : Int32, width : Int32)
      @terrain_sample = terrain_sample
      @matrix = ::Matrix.new(height, width)

      populate(@matrix, @terrain_sample)
    end

    # -------------------- Private Methods --------------------

    private def populate(grid, terrain_sample)
      # Fill the entire area with the terrain
      @matrix.grid.each_with_index do |row, r_idx|
        row.each_with_index do |col, c_idx|
          @matrix.add_terrain(c_idx, r_idx, @terrain_sample.class.new)
        end
      end

      # Start from the left, knock out pieces with Null
      @matrix.grid.each_with_index do |row, r_idx|
        1.upto(row.size) do |n|
          break if should_stop
          @matrix.add_terrain((n - 1), r_idx, Terrain::Null.new)
        end
      end

      # Go from the right, knock out pieces with null
      @matrix.grid.each_with_index do |row, r_idx|
        row.size.downto(1) do |n|
          break if should_stop
          @matrix.add_terrain((n - 1), r_idx, Terrain::Null.new)
        end
      end
    end

    private def should_stop
      (Random.rand(2) == 1)
    end
  end
end
