module Asciichart

  class Chart

    CHART_SYNTAX = /^[\ \+\-\^<>V]$+/

    def self.valid?(input)
      input =~ CHART_SYNTAX
    end

    attr_accessor :width, :height

    def initialize(input)
      calc_width(input)
      calc_height(input)
    end 

    def render

    end

    def calc_width(input)
      @width = 0
      input.each_line do |line|
        if @width < line.length-1
          @width = line.length-1
        end
      end  
    end

    def calc_height(input)
      @height = input.lines.count 
    end

  end
end
