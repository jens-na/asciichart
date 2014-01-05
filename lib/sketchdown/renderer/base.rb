module Sketchdown

  module Renderer

    class Base

      attr_reader :width
      attr_reader :height

      def initialize(width, height, options = {})
        @width = width
        @height = height
      end

      def render(figure)
        case figure.type
        when :rectangle
          render_rectangle(figure)
        when :line
          render_line(figure)
        end
      end

      def render_rectangle(rectangle)
        raise NotImplementedError
      end

      def render_line(line)
        raise NotImplementedError
      end

    end
  end
end
