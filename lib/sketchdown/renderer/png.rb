module Sketchdown

  module Renderer

    class Png < Base

      def initialize(width, height, options = {})
        super
        @sx = options['scale_x']
        @sy = options['scale_y']
        bg = options['bgcolor']
      end

      def render_rectangle(rectangle)
      end

      def render_line(line)
      end

      def render_finish
      end

    end
  end
end
