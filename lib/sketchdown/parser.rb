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

    # Returns all sub layer of a given root layer.
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

    # Checks if the given layer contains areas and return them in
    # an array.
    #
    # layer - the given root layer used for calculation
    #
    # Returns a list of areas or an empty array if no areas found 
    def get_areas(layer)
      areas = Array.new

      
    end

  end
end
