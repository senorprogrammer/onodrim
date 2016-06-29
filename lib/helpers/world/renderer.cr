module Helpers
  module World
    class Renderer
      property world

      def initialize(world : ::World)
        @world = world
      end

      def to_s
        return "" unless @world

        @world.matrix.grid.reduce("") do |grid_acc, row|
          res = row.reduce("") do |row_acc, terrain|
            row_acc += terrain.to_s
          end

          grid_acc += res + "\n"
        end
      end
    end
  end
end
