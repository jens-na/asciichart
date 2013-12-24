module Sketchdown
  class Textgrid

    attr_reader :input
    attr_reader :root
    attr_reader :maxwidth
    attr_reader :maxheight

    # all the marks which may be available in the grid.
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
      :corner => { 
        :all => [ '+' ]
      },
      :blank => {
        :all => [ ' ' ]
      }
    }

    # Initialize a new Chart with the given input
    #
    # input - the input chart
    #
    # Returns the new chart
    def initialize(input)
      @maxwidth = calc_maxwidth(input)
      @maxheight = calc_maxheight(input)
      @input = input.chomp
      populate_root_layer(input)
    end 

    # Parses the input data without the trailing newline
    # characters.
    #
    # input - the input chart
    def populate_root_layer(input)
      x = 0
      y = 0
      @root = Layer.new

      input.each_line do |line|
        line.chomp.each_char do |char|
          @root.add(Textcell.new(x,y))
          x+=1
        end
        x=0
        y+=1
      end
    end

    # Returns the textual represenation of the cell in the
    # grid, also checks if the cell is available
    #
    # cell - the cell with the corresponding (x,y) pair
    #
    # Returns the text or nil if cell does not exist
    def get_char(cell)
      return nil if cell == nil
      ch = nil

      if cell.y < @input.lines.count
        line = @input.lines[cell.y]
        ch = line[cell.x]
      end
    end

    # Returns the neighbors of the current cell with is specifally
    # the northern, southern, western and eastern cell.
    #
    # cell - the cell with the corresponding (x,y) pair
    #
    # Returns the cells as a hash
    def get_neighbors(cell)
      hash = Hash.new
      north = cell.north
      south = cell.south
      west = cell.west
      east = cell.east

      if @root.include?(north)
        hash[:north] = north
      end
      if @root.include?(south)
        hash[:south] = south
      end
      if @root.include?(west)
        hash[:west] = west
      end
      if @root.include?(east)
        hash[:east] = east
      end
      hash
    end

    # Returns all the neghbors of the current cell which is specifically
    # :north, :south, :west, :east, :north_west, :north_east, :south_west
    # and :south_east
    #
    # cell - the cell with the corresponding (x,y) pair
    #
    # Returns the cells as a hash
    def get_neighbors_all(cell)
      hash = get_neighbors(cell)
      north_east = cell.north_east
      north_west = cell.north_west
      south_east = cell.south_east
      south_west = cell.south_west

      if @root.include?(north_east)
        hash[:north_east] = north_east
      end
      if @root.include?(north_west)
        hash[:north_west] = north_west
      end
      if @root.include?(south_west)
        hash[:south_west] = south_west
      end
      if @root.include?(south_east)
        hash[:south_east] = south_east
      end
      hash
    end

    # Checks if the specified cell reflects the given mark
    #
    # cell - the cell to check
    # mark - the mark (:line, :arrow, etc.)
    #
    # Returns true or flase and the direction type of the
    # figure 
    def is_figure(cell, mark)
      marks = MARKS[mark]
      ch = get_char(cell)
      includes = false
      type = nil

      marks.each do |k,v|
        if v.include?(ch)
          includes = true

          if mark == :corner
            type = get_corner_type(cell)
          else
            type = k
          end
        end
      end
      return [includes, type]
    end

    def is_hline?(cell)
      is_figure(cell, :line)[1] == :horizontal
    end

    def is_vline?(cell)
      is_figure(cell, :line)[1] == :vertical
    end

    # Determines the corner type of the current cell.
    #
    # cell - the cell which is used for determination
    #
    # Returns :north_east, :north_west, :south_east,
    # :south_west
    def get_corner_type(cell)
      neighbors = get_neighbors(cell)
      north = neighbors[:north]
      south = neighbors[:south]
      west = neighbors[:west]
      east = neighbors[:east]

      if is_hline?(east) && is_vline?(south)
        :north_west
      elsif is_hline?(west) && is_vline?(south) 
        :north_east
      elsif is_hline?(west) && is_vline?(north)
        :south_east
      elsif is_hline?(east) && is_vline?(north)
        :south_west
      end
    end

    # Calculates the width. The width is the length of the line with
    # the most caharacters.
    #
    # input - the input which should be used for calculation
    #
    # Returns the width
    def calc_maxwidth(input)
      width = 0
      input.each_line do |line|
        if width < line.length-1
          width = line.length-1
        end
      end
      width
    end

    # Calculates the height of the input.
    #
    # input - the input which should be used for calculation
    #
    # Returns the height
    def calc_maxheight(input)
      input.lines.count 
    end

  end
end
