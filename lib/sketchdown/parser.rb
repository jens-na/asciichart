module Sketchdown

  class Parser

    def initialize(grid)
      @grid = grid
      @root = @grid.root
    end

    def parse
      
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
      for e in layer
        if @grid.is_figure(e, [:corner, :north_west])
          east_cells = layer.get_sublayer(e, :east)
          

        end
      end

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
    def follow_figure(layer, from, to)
      cells = []
      first = layer.cells[0]

      # first cell must fit the from rule
      if @grid.is_figure(first, from[0]) == [false, nil]
        return nil
      end

      i = 0
      begin
        cell = layer[i]
        cellnext = layer[i+1]

        if @grid.get_figure(cell) == from
          cells.push(cell)
        end

        if @grid.get_figure(cellnext) == to
          return cells
        end

        i+=1
      end until i > layer.cells.length

      cells
    end

    # Checks if the given layer is an area.
    #
    # Example:
    #   +------+      
    #   |      | 
    #   +------+      
    #                 
    # The function specifically checks if the last cell
    # is a neighbor of the first cell.
    #
    # layer - the layer which contains the cells
    # 
    # Returns true if the layer is an area or false
    def is_area?(layer)
      
    end

  end
end
