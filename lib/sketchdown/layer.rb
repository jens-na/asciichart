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

    def_delegators :@layer, :each

  end
end
