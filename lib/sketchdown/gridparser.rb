module Sketchdown

  class GridParser

    def initialize(grid, options = {})
      @grid = grid
      @options = options
    end

    def parse
      for e in @grid.cells
        if e.figure == [:corner, :north_west]

        end 
      end
    end

  end
end
