module Sketchdown

  module Renderer

    class Base

      attr_reader :width
      attr_reader :height
      attr_reader :options

      def initialize(width, height, options = {})
        @width = width
        @height = height
        @options = options
      end

      def render(figure)
        case figure.type
        when :rectangle
          render_rectangle(figure)
        when :line
          render_line(figure)
        end
      end

      # The method which needs to be implemented by subclasses.
      # Renders a rectangle
      #
      # rectangle - the ractangle object
      def render_rectangle(rectangle)
        raise NotImplementedError
      end

      # The method which needs to be implemented by subclasses.
      # Renders a line
      #
      # line - the line object
      def render_line(line)
        raise NotImplementedError
      end

      # The method which needs to be implemented by subclasses.
      # Finishes the renderin and returns the object
      #
      # Returns the object or nil if no object is created
      def render_finish
        raise NotImplementedError
      end

    end
  end
end
