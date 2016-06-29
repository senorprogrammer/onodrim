require "../base"

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

    def initialize(terrain_sample : Terrain::Base, rows : Int32, cols : Int32)
      @terrain_sample = terrain_sample
      @matrix = ::Matrix.new(rows, cols)

      populate(@matrix, @terrain_sample)
    end

    def regenerate
      populate(@matrix, @terrain_sample)
    end

    def to_s
      @matrix.to_s
    end

    # -------------------- Private Methods --------------------

    private def populate(grid, terrain_sample)
      # Fill the entire area with the terrain
      @matrix.grid.each_with_index do |row, r_idx|
        row.each_with_index do |col, c_idx|
          @matrix.place_at(r_idx, c_idx, @terrain_sample.class.new)
        end
      end

      # Start from the left, knock out pieces with Null
      @matrix.grid.each_with_index do |row, r_idx|
        1.upto(row.size) do |n|
          (Random.rand(2) == 0) ? @matrix.place_at(r_idx, (n - 1), Terrain::Null.new) : break
        end
      end

      # Go from the right, knock out pieces with null
      @matrix.grid.each_with_index do |row, r_idx|
        row.size.downto(1) do |n|
          (Random.rand(2) == 0) ? @matrix.place_at(r_idx, (n - 1), Terrain::Null.new) : break
        end
      end
    end
  end
end
