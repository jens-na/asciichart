module Sketchdown

  module Renderer

    class Base

      def initialize

      end

      def render

      end

      def render_size(width, height)

      end

      def render_rectangle(x, y, width, height)
        raise NotImplementedError
      end

      def render_line(x1, y1, x2, y2)
        raise NotImplementedError
      end

      def render_arrow(x, y, type)
        raise NotImplementedError
      end

      def render_corner(x, y, type)
        raise NotImplementedError
      end
      
    end
  end
end
