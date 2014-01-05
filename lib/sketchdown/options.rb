module Sketchdown

  class Options < Hash

    OPTIONS = {

      # the default renderer to use
      'renderer' => 'png',

      #...other basic options...
    }

    RENDERING_HINTS = {

      # the line style, which may be
      # :solid, :dashed
      :linestyle => :solid,

      # the corner style which may be
      # :edged, :rounded
      :corners => :edged,

      # the default color for the background
      :bgcolor => '#000000',

      # the default color for the painintg (lines,
      # rectangles, etc)
      :fgcolor => '#ffffff',

      # the color for the text
      :textcolor => '#ffffff'

      # ...other default options...
    }

    RENDERER_OPTIONS = {
    
      'png' => {
        
      }

      # ...other renderer...
    }

  end
end
