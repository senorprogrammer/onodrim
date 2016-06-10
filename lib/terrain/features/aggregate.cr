require "../type"

module Terrain
  class Aggregate
    property matrix

    def initialize(terrain_sample : Terrain::Type, rows : Int32, cols : Int32)
      @terrain_sample = terrain_sample
      @matrix = Terrain::Matrix.new(rows, cols)

      populate(@matrix, @terrain_sample)
    end

    def regenerate
      populate(@matrix, @terrain_sample)
    end

    def to_s
      @matrix.to_s
    end

    # -------------------- Private Methods --------------------

    # NOTE: This is terribly inefficient. Don't look at this. Don't look!
    #
    # Better approach?
    #
    # For each row:
    # - Pick an offset from the left of the current row
    # - Pick a rand num from the length of the current row
    # - Fill that many cols with Terrain. Fill the rest with Null
    #
    # Ok, tried that ^ approach. Not better. Faster, but worse-looking forests.
    #

    private def populate(grid, terrain_sample)
      # Fill the entire aggregate area with the terrain
      @matrix.grid.each_with_index do |row, r_idx|
        row.each_with_index do |col, c_idx|
          @matrix.place_at(r_idx, c_idx, @terrain_sample.class.new)
        end
      end

      # Now walk the rows and knock out some pieces.
      #
      # On each row, start at the left. Flip a coin. If 0, then
      # remove that terrain and move on to the next piece in the row.
      # If 1, leave that piece alone.
      @matrix.grid.each_with_index do |row, r_idx|
        row.each_with_index do |col, c_idx|
          flip = Random.rand(3)

          @matrix.place_at(r_idx, c_idx, Terrain::Null.new) unless (flip == 0)
        end
      end

      # Now backfill. Walk each piece. If the neightbour to the left and right
      # are both not Terrain::Null, fill it in with whatever the neighbour to the
      # left is
      @matrix.grid.each_with_index do |row, r_idx|
        row.each_with_index do |col, c_idx|
          next if c_idx == 0

          this = @matrix.at(r_idx, c_idx)
          left = @matrix.at(r_idx, (c_idx - 1))
          rght = @matrix.at(r_idx, (c_idx + 1))

          next unless this.is_a? Terrain::Null
          next unless (!left.is_a? Terrain::Null) || (!rght.is_a? Terrain::Null)

          @matrix.place_at(r_idx, c_idx, @terrain_sample.class.new)
        end
      end
    end
  end
end
