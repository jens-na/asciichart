module Sketchdown

  class Chart

    attr_reader :renderer, :input, :grid

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

    POINT_START = '+'

    # Initialize a new Chart with the given input and renderer
    #
    # input - the input chart
    # renderer - the renderer
    #
    # Returns the new chart
    def initialize(input, renderer)
      @grid = Textgrid.new(input)
      @renderer = renderer
    end 

    def render
    end

  end
end
