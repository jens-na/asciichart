require 'chunky_png'

module Sketchdown

  module Renderer

    class Png < Base

      def initialize(width, height, options = {})
        super
        @png = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
      end

      def render_rectangle(rectangle)
      end

      def render_line(line)
      end
    end
  end
end
