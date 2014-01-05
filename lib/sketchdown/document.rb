module Sketchdown

  class Document

    attr_reader :input
    attr_reader :options
    attr_reader :figures

    # Initializes a new sketch document with the given plain text
    # information
    #
    # input - the plain text diagram which should be rendered
    # options - the additional options to set or override
    #
    # Returns a new document
    def initialize(input, options = {})
      @input = input
      @options = options

      @grid = Textgrid.new(input, options)
      @parser = GridParser.new(@grid, options)
      @figures = @parser.parse
    end

    # Render each parsed figure with the specified renderer.
    #
    # renderer - a renderer name like Png
    def render(renderer)
      output = Renderer.const_get(renderer).new(@grid.width, @grid.height)

      for e in @figures
        output.render(e) 
      end
    end

    # Checks if there is a method which matches the pattern
    # to_* and try to load the renderer.
    #
    # For example to_png will use the 'png' renderer for the
    # output of the diagrams.
    def method_missing(m, *args, &block)
      if m.to_s =~ /^to_(\w+)$/
        renderer = m.to_s.split('_')[1]
        renderer = renderer[0].upcase + renderer[1..-1]
        try_require(renderer)
        render(renderer)
      else
        super
      end
    end

    # Try requiring a parser or converter class and don't raise an error if the file is not found.
    def try_require(name)
      require("sketchdown/renderer/#{name.downcase}")
      true
    rescue LoadError
      true
    end
    protected :try_require

  end
end
