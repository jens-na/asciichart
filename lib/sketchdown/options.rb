module Sketchdown

  class Options < Hash

    OPTIONS = {

      # the default renderer to use
      'renderer' => 'png',

      # don't parse the blanks left or right to the
      # sketch
      'shrink' => false
    }

  end
end
