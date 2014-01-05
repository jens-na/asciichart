module Sketchdown

  class Rectangle < Figure

    attr_reader :x
    attr_reader :y
    attr_reader :width
    attr_reader :height

    # the cells of the rectangle including the rectangle
    # marks like +,-,| etc.
    #
    # Example:
    # +-----+
    # |     |
    # +-----+
    attr_accessor :cells

    def initialize(x, y, width, height, hints = {})
      super(:rectangle, hints)
      @x = x
      @y = y
      @width = width
      @height = height
    end

    # Returns all the cells which are inside the rectangle.
    # If no cells could be determined nil is returned.
    def get_cells_inside
      return nil if cells.to_a.empty?
      cells = []

      for e in @cells
        if inside?(e.x,e.y)
          cells.push(e)
        end
      end
      cells
    end

    # Checks if the specified x,y coorindate is available
    # in the rectangle. This method also returns true if
    # the (x,y) coorinate is one of the rectangle marks.
    #
    # Example:
    #   +--+      0,0 #=> true 
    #   |  |      1,1 #=> true 
    #   +--+      0,4 #=> false
    #
    # Returns true if the specified x,y coorinate is part
    # of the rectangle.
    def include?(x,y)
      max_x = @x+@width
      max_y = @y+@height

      x.between?(@x, max_x) && y.between?(@y,max_y)
    end

    # Checks if the specified x,y coordinate is inside the
    # rectangle. Only returns true if the cell is *inside*
    # the rectangle. The marks of the rectangle are excluded.
    #
    # Example:
    #   +--+      0,0 #=> false
    #   |  |      1,1 #=> true
    #   +--+      0,4 #=> false
    #
    # Returns true if the x,y coordinate is inside the rectangle
    def inside?(x,y)
      min_x = @x+1
      min_y = @y+1
      max_x = @x+@width-1
      max_y = @y+@height-1

      x.between?(min_x, max_x) && y.between?(min_y,max_y)
    end

  end
end
