module Sketchdown
  class Textgrid

    attr_reader :input
    attr_reader :grid
    attr_reader :maxwidth
    attr_reader :maxheight

    # Initialize a new Chart with the given input
    #
    # input - the input chart
    #
    # Returns the new chart
    def initialize(input)
      @maxwidth = calc_maxwidth(input)
      @maxheight = calc_maxheight(input)
      @input = input.chomp
      parse_input(input)
    end 

    # Parses the input data without the trailing newline
    # characters.
    #
    # input - the input chart
    def parse_input(input)
      x = 0
      y = 0
      @grid = Array.new

      input.each_line do |line|
        line.chomp.each_char do |char|
          @grid.push(Textcell.new(x,y))
          x+=1
        end
        x=0
        y+=1
      end
    end

    # Checks if a cell exists in the current grid
    #
    # cell - the cell with the corresponding (x,y) pair
    #
    # Returns true or false
    def cell_exists?(cell)
      exists = false
      for e in @grid
        x_valid = (e.x == cell.x)
        y_valid = (e.y == cell.y)

        if x_valid && y_valid
          exists = true
          break
        end
      end
      exists
    end

    # Returns the textual represenation of the cell in the
    # grid, also checks if the cell is available
    #
    # cell - the cell with the corresponding (x,y) pair
    #
    # Returns the text or nil if cell does not exist
    def get_char(cell)
      ch = nil
      if cell.y < @input.lines.count
        line = @input.lines[cell.y]
        ch = line[cell.x]
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
