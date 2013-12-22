module Sketchdown

  class Document

    attr_reader :input

    attr_reader :grid

    attr_reader :options

    # Initializes a new sketch document with the given plain text
    # information
    #
    # input - the plain text diagram which should be rendered
    # options - the additional options to set or override
    #
    # Returns a new document
    def initialize(input, options = {})
    end

    # Checks if there is a method which matches the pattern
    # to_* and try to load the renderer.
    #
    # For example to_png will use the 'png' renderer for the
    # output of the diagrams.
    def method_missing(m, *args, &block)

    end

  end
end
