module Sketchdown

  class Figure

    # The rendering hints for a figure
    # this might be something like this:
    #
    # hints = {
    #   :dashed => true
    #   :color => #ffffff
    # }
    attr_reader :hints

    # The figure type
    #
    # Example:
    # :rectangle
    # :line
    attr_reader :type

    def initialize(type, hints = {})
      @hints = hints
      @type = type
    end
  end
end
