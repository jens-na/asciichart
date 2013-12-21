module Asciichart

  class Chart

    CHART_SYNTAX = /^[\ \+\-\^<>V]$+/

    def self.valid?(input)
      input =~ CHART_SYNTAX
    end

    attr_reader :width, :height

    # Initialize a new Chart with the given input
    #
    # input - the input chart
    #
    # Returns the new chart
    def initialize(input)
      @width = calc_width(input)
      @height = calc_height(input)
    end 

    def render

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
      widt
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
