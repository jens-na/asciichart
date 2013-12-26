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
      hline = [:line, :horizontal]
      vline = [:line, :vertical]
      areas = []

      for e in layer.cells
        if @grid.get_figure(e) == [:corner, :north_west]
          cells = Array.new
          
          # get line between north west and north east corner
          east_layer = layer.get_sublayer(e, :east)
          line = follow_figure(east_layer, hline, [:corner, :north_east], :east)
          next if line == nil
          cells.concat(line) 

          # get line between north east and south east corner
          south_layer = layer.get_sublayer(line[-1].east, :south)
          line = follow_figure(south_layer, vline, [:corner, :south_east], :south)
          next if line == nil
          cells.concat(line)

          # get line between south east and south west corner
          west_layer = layer.get_sublayer(line[-1].south, :west)
          line = follow_figure(west_layer, hline, [:corner, :south_west], :west)
          next if line == nil
          cells.concat(line)
          
          # get line between south west and north west corner
          north_layer = layer.get_sublayer(line[-1].west, :north)
          line = follow_figure(north_layer, vline, [:corner, :north_west], :north)
          next if line == nil
          cells.concat(line)

          area = Layer.new
          area.add_all(cells)
          areas.push(area)
        end
      end
      areas
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
      calclayer = layer.cells
      if direction == :west || direction == :north
        calclayer = layer.cells.reverse
      end

      first = calclayer[0]

      # first cell must fit the from rule
      if @grid.is_figure(first, from[0]) == [false, nil]
        return nil
      end

      cells = []
      i = 0
      begin
        cell = calclayer[i]
        cellnext = calclayer[i+1]

        if @grid.get_figure(cell) == from
          cells.push(cell)
        end

        if @grid.get_figure(cellnext) == to
          return cells
        end

        i+=1
      end until i > calclayer.length

      nil
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
