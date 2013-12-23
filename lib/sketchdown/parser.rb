module Sketchdown

  class Parser

    # corner :north_west
    # Figure:
    # +-
    # |
     
    # corner :south_west
    # Figure:
    # |
    # +-
     
    # corner :north_east
    # Figure:
    # -+
    #  |
     
    # corner :south_east
    # Figure:
    #  |
    # -+
     
    # line :horizintal
    # Figure:
    # -
     
    # line :vertical
    # Figure:
    # |
     
    # arrow :west
    # Figure:
    # <
     
    # arrow :east
    # Figure:
    # >
     
    # arrow :north
    # Figure:
    # ^
     
    # arrow :south
    # Figure
    # V or v
    
    MARKS = {
      :line => {
        :vertical => [ '|' ],
        :horizontal => [ '-' ]
      },
      :arrow => {
        :north => [ '^' ],
        :south => [ 'v', 'V' ],
        :west => [ '<' ],
        :east => [ '>' ]
      }, 
      :corner => [ '+' ],
      :blank => [ ' ' ]
    }

    def initialize(grid, options)
      @grid = grid
      @options = options
    end

    def parse

    end

    # Checks if the given cell is blank
    #
    # cell - the cell to check
    #
    # Returns true or false
    def is_blank?(cell)
      marks = MARKS[:blank]
      ch = @grid.get_char(cell)

      # this should not happen, but if no char can be found the 
      # cell is probably out of bounds so it should be blank
      return true if ch == nil

      marks.include?(ch)
    end

    # Checks if the given cell is a corner
    #
    # cell - the cell to check
    #
    # Returns true or false and the corner type
    def is_corner?(cell)
      marks = MARKS[:corner]
      includes = marks.include?(@grid.get_char(cell))
      type = nil

      # determine the type of the corner
      if includes
        neighbors = @grid.get_neighbors(cell)
        north = neighbors[:north]
        south = neighbors[:south]
        west = neighbors[:west]
        east = neighbors[:east]

        if is_hline(east) && is_vline(south)
          type = :north_west
        elsif is_hline(west) && is_vline(south) 
          type = :north_east
        elsif is_hline(west) && is_vline(north)
          type = :south_east
        elsif is_hline(east) && is_vline(north)
          type = :south_west
        end
      end
      return [includes, type]
    end

    # Checks if the cell is a north west corner
    def is_corner_nw?(cell)
      return is_corner?(cell)[1] == :north_west
    end

    # checks if the cell is a north east corner
    def is_corner_ne?(cell)
      return is_corner?(cell)[1] == :north_east
    end

    # Checks if the cell is a south west corner
    def is_corner_sw?(cell)
      return is_corner?(cell)[1] == :south_west
    end

    # Checks if the cell is a south east corner
    def is_corner_se?(cell)
      return is_corner?(cell)[1] == :south_east
    end

    # Checks if the given cell is a line.
    #
    # cell - the cell to check
    #
    # Returns true or false and the line type
    def is_line?(cell)
      marks = MARKS[:line]
      ch = @grid.get_char(cell)
      includes = false
      type = nil

      marks.each do |k,v|
        if v.include?(ch)
          includes = true
          type = k
        end
      end
      return [includes, type]
    end

    # Checks if the given cell is a vertical line
    #
    # cell - the cell to check
    #
    # Returns true if the cell is a vertical line
    def is_vline?(cell)
      return is_line(cell)[1] == :vertical
    end

    # Checks if the given cell is a horizintal line
    #
    # cell - the cell to check
    #
    # Returns true if the cell is a horizintal line
    def is_hline(cell)
      return is_line(cell)[1] == :horizontal
    end

    # Checks if the given cell is an arrow (head)
    #
    # cell - the cell to check
    #
    # Returns true or false
    def is_arrow?(cell)
      marks = MARKS[:arrow]
      ch = @grid.get_char((cell))
      includes = false
      type = nil

      marks.each do |k,v|
        if v.includes?(ch)
          includes = true
          type = k
        end
      end
      return [includes, type]
    end

  end
end
