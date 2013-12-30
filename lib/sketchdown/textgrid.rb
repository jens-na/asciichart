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
        :horizontal  => ['-'],
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

    def initialize(input)
      @input = input.chomp
      @width = calc_width(input)
      @height = calc_height(input)
      populate_grid(input)
    end

    def populate_grid(input)
      x = 0
      y = 0
      @cells = Array.new

      input.each_line do |line|
        line.chomp.each_char do |char|
          cell = Textcell.new(x,y)
          figure = get_figure(cell)
          cell.set_figure(figure)
          @cells.push(cell)
          x+=1
        end
        x=0
        y+=1
      end
    end


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

    def get_char(cell)
      return nil if cell == nil
      ch = nil

      if cell.y < @input.lines.count
        line = @input.lines[cell.y]
        ch = line[cell.x]
      end
    end
    
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

    def is_hline?(cell)
      get_figure(cell) == [:line, :horizontal]
    end

    def is_vline?(cell)
      get_figure(cell) == [:line, :vertical]
    end

    def calc_width(input)
      width = 0
      input.each_line do |line|
        if width < line.length-1
          width = line.length-1
        end
      end
      width
    end

    def calc_height(input)
      input.lines.count 
    end

  end
end
