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

      :corner => [ '+' ],

      :arrow => {
        :north => [ '^' ],
        :south => [ 'v', 'V' ],
        :west => [ '<' ],
        :east => [ '>' ]
      }

    }

    def initialize(grid, options)
      @grid = grid
      @options = options
    end

    def parse

    end

    # Checks if the given cell is a corner
    #
    # cell - the cell to check
    #
    # Returns true or false
    def is_corner?(cell)
      marks = MARKS[:corner]
      marks.include?(@grid.get_char(cell))
    end

    # Checks if the given cell is a line.
    #
    # cell - the cell to check
    #
    # Returns true or false
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
      return includes, type
    end

    # Checks if the given cell is an arrow (head)
    #
    # cell - the cell to check
    #
    # Returns true or false
    def is_arrow?(cell)
      marks = MARKS[:arrow]
      ch = @grid.get_char((cell))
    end

  end
end
