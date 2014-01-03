module Sketchdown

  class Rectangle

    attr_reader :x
    attr_reader :y
    attr_reader :width
    attr_reader :height

    def initialize(x,y,wdith,height)
      @x = x
      @y = y
      @width = width
      @height = height
    end

  end
end
