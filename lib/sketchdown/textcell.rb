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
      if @y == 0
        nil
      else
        Textcell.new(@x, @y-1)
      end
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

    def north_east
      Textcell.new(@x+1, @y-1)
    end

    def north_west
      Textcell.new(@x-1, @y-1)
    end

    def south_east
      Textcell.new(@x+1, @y+1)
    end

    def south_west
      Textcell.new(@x-1, @y+1)
    end

    def is_north_of(cell)

    end

    def is_south_of(cell)

    end

    def is_west_of(cell)

    end

    def is_east_of(cell)

    end

  end
end
