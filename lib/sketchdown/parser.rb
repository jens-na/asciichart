module Sketchdown

  class Parser

    def initialize(grid)
      @grid = grid
      @root = @grid.root
    end

    def parse

      for e in @root

      end
      
    end

    # Returns all subsets of a given layer.
    #
    # Example:
    # +----------+
    # | +---+    |         +------+
    # | |   |    | <------ |      |
    # | +---+    |         +------+
    # +----------+
    #
    # layer 0:
    # +----------+
    # | +---+    |
    # | |   |    |
    # | +---+    |
    # +----------+
    #
    # layer 1:
    # <------
    #
    # layer 2:
    # +------+
    # |      |
    # +------+
    #
    # layer - the layer used for calculation
    #
    # Returns an array of other layer
    def get_layers(layer)
      
    end

  end
end
