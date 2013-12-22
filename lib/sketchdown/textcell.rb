module Sketchdown

  class Textcell

    attr_reader :x
    attr_reader :y

    # Initializes a cell with the corresponding (x,y) pair
    #
    # x - the x value, refers to a character in a line
    # y - the y value, refers to the line no of the input
    def initialize(x,y)
      @x = x
      @y = y
    end

    # Returns the cell which is "north" of the current cell. If
    # y is 0 nil will be returned, negative cells are not allowed.
    def north
      return nil if @y == 0
      Textcell.new(@x, @y-1)
    end

    # Returns the cell which is "south" of the current cell.
    def south
      Textcell.new(@x, @y+1)
    end

    # Returns the cell which is westward of the current cell.
    def west
      Textcell.new(@x-1, @y)
    end

    # Returns the cell which is eastward of the current cell.
    def east
      Textcell.new(@x+1, @y)
    end

    # Returns the north eastern cell
    def north_east
      Textcell.new(@x+1, @y-1)
    end

    # Returns the north western cell
    def north_west
      Textcell.new(@x-1, @y-1)
    end

    # Returns the south eastern cell
    def south_east
      Textcell.new(@x+1, @y+1)
    end

    # Returns the south western cell
    def south_west
      Textcell.new(@x-1, @y+1)
    end

    def ==(other)
      other.class == self.class && other.state == state
    end
    alias_method :eql?, :==

    # Helper method to implement equality
    def state
      [@x, @y]
    end

    protected :state

  end
end
