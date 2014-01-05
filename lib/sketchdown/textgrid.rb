module Sketchdown

  class Textgrid

    # The chomped input
    attr_reader :input

    # The cells found in the input with the appropriate
    # figures
    attr_reader :cells

    # the absolute width of the grid which is the count
    # of the longest line in the given input
    attr_reader :width

    # the height of the grid, which is the lines count
    # of the input
    attr_reader :height

    # all the input figures which may be available in the 
    # input. Each figure has a specialization.
    #
    # Examples:
    #   [corner, :north_west]
    #   [:line, :vertical]
    #   [:blank, :all]
    INPUT_FIGURES = { 
      :line => {
        :horizontal   => ['-'],
        :vertical     => ['|']
      },

      :corner => {
        :all          => ['+']
      },

      :blank => {
        :all          => [' ']
      },

      :arrowhead => {
        :north        => ['^'],
        :south        => ['v', 'V'],
        :west         => ['<'],
        :east         => ['>']
      }
    }

    def initialize(input, options = {})
      @input = input.chomp
      @width = calc_width(@input)
      @height = calc_height(@input)
      populate_grid(@input)
    end

    # Initializes the root grid
    #
    # input the input as plain text
    def populate_grid(input)
      x = 0
      y = 0
      @cells = Array.new

      input.each_line do |line|
        line.chomp.each_char do |char|
          cell = Textcell.new(x,y)
          cell.set_parent(self)
          @cells.push(cell)
          x+=1
        end
        x=0
        y+=1
      end

      populate_figures
    end
    
    # populate the figures for each cell in the grid
    def populate_figures
       for e in @cells
         e.set_figure(get_figure(e))
       end
    end


    # Returns a cell from the populated input
    #
    # x - x value
    # y - y value
    #
    # Returns the cell or nil if no cell could be found.
    def get(x,y)
      @cells.select { |e| e.x == x && e.y == y }[0]
    end

    # Returns the figure of a given cell as an array with
    # two values.
    #
    # Example:
    #   [:lime, :horizintal]   #=> horinzontal line
    #   [:corner, :south_west] #=> a south west corner
    #
    # cell - the cell
    #
    # Returns the figure as an array or an array with two
    # nil values if no figure found for the given cell.
    def get_figure(cell)
      ch = get_char(cell)
      rettype = nil
      
      INPUT_FIGURES.each do |mark,types|
        types.each do |type,array|
          if array.include?(ch)
            rettype = type
            if mark == :corner
              rettype = get_corner_type(cell)
            end
            return [mark, rettype]
          end
        end
      end
      [nil, nil]
    end

    # Returns the character of the given cell.
    #
    # cell - the cell
    #
    # Returns the character or nil if no char
    # found.
    def get_char(cell)
      return nil if cell == nil
      ch = nil

      if cell.y < @input.lines.count
        line = @input.lines[cell.y]
        ch = line[cell.x]
      end
    end
    
    # Returns the corner type of the given cell.
    #
    # Example:
    #    :south_west
    #    :north_west
    # 
    # cell - the cell
    #
    # Returns the type
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

    # Returns the neighbors of the specified cell. Specifically returns 
    # the north, south, east and west cell as a hash.
    #
    # Values in the hash may be nil.
    def get_neighbors(cell)
      hash = Hash.new
      north = cell.north
      south = cell.south
      west = cell.west
      east = cell.east

      if @cells.include?(north)
        hash[:north] = north
      end
      if @cells.include?(south)
        hash[:south] = south
      end
      if @cells.include?(west)
        hash[:west] = west
      end
      if @cells.include?(east)
        hash[:east] = east
      end
      hash
    end

    # Returns all the neighbors of the specified cell.
    # (north, east, south, west, north_east, south_west, north_west,
    # south_east)
    #
    # Values in the hash may be nil.
    def get_neighbors_all(cell)
      hash = get_neighbors(cell)
      north_east = cell.north_east
      north_west = cell.north_west
      south_east = cell.south_east
      south_west = cell.south_west

      if @cells.include?(north_east)
        hash[:north_east] = north_east
      end
      if @cells.include?(north_west)
        hash[:north_west] = north_west
      end
      if @cells.include?(south_west)
        hash[:south_west] = south_west
      end
      if @cells.include?(south_east)
        hash[:south_east] = south_east
      end
      hash
    end

    # Checks if the given cell is a horizontal line
    # Returns true or false
    def is_hline?(cell)
      get_figure(cell) == [:line, :horizontal]
    end

    # Checks if the given cell is a vertical line
    # Returns true or false
    def is_vline?(cell)
      get_figure(cell) == [:line, :vertical]
    end

    # Calculates the max width of the given input as
    # an integer.
    #
    # Returns an integer
    def calc_width(input)
      width = 0
      input.each_line do |line|
        if width < line.length-1
          width = line.length-1
        end
      end
      width
    end

    # Calculates the max height of the given input as 
    # an integer.
    #
    # Returns an integer
    def calc_height(input)
      input.lines.count 
    end

  end
end
