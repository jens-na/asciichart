module Asciichart
  class Textgrid

    attr_reader :width, :height
    attr_reader :grid

    POINT_ARROWS = { 
      :north => ['^'],
      :south => ['v', 'V'],
      :west => ['<'],
      :east => ['>']
    }

    POINT_LINES = {
      :horizontal => ['-'],
      :vertical => ['|']
    }

    POINT_START = [ '+', '|' ]

    # Initialize a new Chart with the given input
    #
    # input - the input chart
    #
    # Returns the new chart
    def initialize(input)
      @width = calc_width(input)
      @height = calc_height(input)

      parse_input(input)
    end 

    def parse_input(input)
      x = 0
      y = 0
      @grid = Array.new

      input.each_line do |line|
        line.each_char do |char|
          @grid.push(Textcell.new(x,y))
          x+=1
        end
        fill_absolute(y)
        y+=1
      end

    end

    # Fills the array of text cells to the absolute width if
    # necessary
    #
    # y - the line to fill
    def fill_absolute(y)


    end

    # Calculates the width. The width is the length of the line with
    # the most caharacters.
    #
    # input - the input which should be used for calculation
    #
    # Returns the width
    def calc_width(input)
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
    def calc_height(input)
      input.lines.count 
    end

  end
end
