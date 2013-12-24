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
    #   +----------+
    #   | +---+    |         +------+
    #   | |   |    | <------ |      |
    #   | +---+    |         +------+
    #   +----------+
    #
    # layer 0:
    #   +----------+
    #   | +---+    |
    #   | |   |    |
    #   | +---+    |
    #   +----------+
    #
    # layer 1:
    #   <------
    #
    # layer 2:
    #   +------+
    #   |      |
    #   +------+
    #
    # layer - the layer used for calculation
    #
    # Returns an array of other layer
    def get_layers(layer)

    end

    # Checks if the given layer contains areas and return them in
    # an array.
    #
    # Example:
    #   +----------+
    #   | +---+    |         +------+
    #   | |   |    | <------ |      |
    #   | +---+    |         +------+
    #   +----------+
    #
    # area 0:
    #   +----------+
    #   | +---+    |
    #   | |   |    |
    #   | +---+    |
    #   +----------+
    #
    # area 1:
    #   +------+
    #   |      |
    #   +------+
    #
    # layer - the given root layer used for calculation
    #
    # Returns a list of areas or an empty array if no areas found 
    def get_areas(layer)

    end

    # Follow an arbitary figure until another figure is reached.
    #
    # Exmaple:
    #
    # from: [:line, :vertical]
    # to: [:corner: north_east]
    # direction: :east
    #
    # will follow the vertical line eastwards until a north east 
    # corner is reached.
    #
    # layer - the layer for the calculcation
    # from - an array which contains a mark and the type
    # to - an array which contains a mark and the type
    # direction - the direction where to follow, which may be
    # :north, :east, :south or :west
    #
    # Returns an array of cells between from and to.
    def follow_figure(layer, from, to, direction)

    end

  end
end
