module Sketchdown

  class Options < Hash

    DEFAULTS = {

      'scale_x' => 15, 
      'scale_y' => 25,
      'bgcolor' => '#ffffff',

      'rendering_hints' => {
        'linestyle'           => 'solid',
        'corners'             => 'edged',
        'fgcolor'             => '#000000',
        'textcolor'           => '#000000'
      }
    }

  end
end
