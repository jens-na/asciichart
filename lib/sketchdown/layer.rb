module Sketchdown

  # The layer class is a set of text cells inside the sketch. A layer
  # may be the root layer of the sketch or a subset of it.
  class Layer
    extend Forwardable

    attr_reader :cells

    # Initializes a new layer
    def initialize
      @cells = Array.new
    end

    # Adds a cell to the layer
    #
    # cell - the cell to add to the layer
    def add(cell)
      @cells.push(cell)
    end

    # Adds an array of cells to the layer
    #
    # cells - an array of cells
    def add_all(cells)
      @cells.concat(cells)
    end

    # Removes a specified cell from the layer
    #
    # cell - the cell to remove
    def remove(cell)
      @cells.delete(cell)
    end

    # Checks if the given cell is part of the layer.
    #
    # cell - the cell to check
    #
    # Returns true or false
    def include?(cell)
      @cells.include?(cell)
    end

    # Returns a sub layer which only contains cells
    # in a specific direction relative to the specified cell.
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
    #      + < (0,0)
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

      if direction == :east
        sublayer.add_all(get_cells_east_of(@cells, cell))
      elsif direction == :west
        sublayer.add_all(get_cells_west_of(@cells, cell))
      elsif direction == :south
        sublayer.add_all(get_cells_south_of(@cells, cell))
      elsif direction == :north
        sublayer.add_all(get_cells_north_of(@cells, cell))
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

    def_delegators :@cells, :each

  end
end
