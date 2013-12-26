# Require all of the Ruby files in the given directory.
#
# path - The String relative path from here to the directory.
#
# Returns nothing.
def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

# stdlib

# internal
require 'sketchdown/textgrid'
require 'sketchdown/layer'
require 'sketchdown/textcell'
require 'sketchdown/document'
require 'sketchdown/renderer'
require 'sketchdown/options'
require 'sketchdown/parser'
