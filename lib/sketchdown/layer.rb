module Sketchdown

  # The layer class is a set of text cells inside the sketch. A layer
  # may be the root layer of the sketch or a subset of it.
  class Layer
    extend Forwardable

    # Initializes a new layer
    def initialize
      @layer = Array.new
    end

    # Adds a cell to the layer
    #
    # cell - the cell to add to the layer
    def add(cell)
      @layer.push(cell)
    end

    # Adds an array of cells to the layer
    #
    # cells - an array of cells
    def add_all(cells)
      @layer.concat(cells)
    end

    # Removes a specified cell from the layer
    #
    # cell - the cell to remove
    def remove(cell)
      @layer.delete(cell)
    end

    # Checks if the given cell is part of the layer.
    #
    # cell - the cell to check
    #
    # Returns true or false
    def include?(cell)
      @layer.include?(cell)
    end

    # Returns a sub layer which only contains cells
    # in a specific deirection relative to the given cell.
    #
    # Example:
    #
    # cell: (1,0)
    # direciton: east
    #
    #      (1,0)    (8,0)
    #       v       v 
    #      +--------+
    # Returns (1,0), (2,0), ..., (8,0)
    #
    # cell: (0,4)
    # direction: north
    #
    #      +
    #      |
    #      |
    #      |
    #      + < (0,4)
    # Returns (0,4), (0,3), ..., (0,0)
    #
    # cell - the start cell
    # direction - the direction
    #
    # Returns a sub layer with the given cells
    def get_sublayer(cell, direction)
      sublayer = Layer.new

      if(direction == :east)
        sublayer.add_all(get_cells_east_of(cell))
      elsif(direction == :west)
        sublayer.add_all(get_cells_west_of(cell))
      elsif(direction == :south)
        sublayer.add_all(get_cells_south_of(cell))
      elsif(direction == :north)
        sublayer.add_all(get_cells_north_of(cell))
      end
      sublayer
    end

    # Returns the cells north of the given cell on a given
    # layer
    def get_cells_north_of(layer, cell)
      cells = Array.new
      for e in layer
        if e.is_north_of(cell) 
          cells.push(e)
        end
      end
      cells
    end

    # Returns the cells south of a given cell on a given
    # layer
    def get_cells_south_of(layer, cell)
      cells = Array.new
      for e in layer
        if e.is_south_of(cell) 
          cells.push(e)
        end
      end
      cells
    end

    # Returns the cells west of a given cell on a given
    # layer
    def get_cells_west_of(layer, cell)
      cells = Array.new
      for e in layer
        if e.is_west_of(cell) 
          cells.push(e)
        end
      end
      cells
    end

    # Returns the cells eastof a given cell on a given 
    # layer
    def get_cells_east_of(layer, cell)
      cells = Array.new
      for e in layer
        if e.is_east_of(cell) 
          cells.push(e)
        end
      end
      cells
    end

    def_delegators :@layer, :each

  end
end
