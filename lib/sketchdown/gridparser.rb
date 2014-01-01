module Sketchdown

  class GridParser

    def initialize(grid, options = {})
      @grid = grid
      @options = options
    end

    def parse
      for e in @grid.cells
        if e.figure == [:corner, :north_west]
          puts 'nw'
          get_rectangle(e)
        end 
      end
    end

    # Returns the rectangle for the corresponding start cell.
    # If nil is returned, no rectangle could be found
    #
    # nw - the start cell (north west corner)
    #
    # Returns an array of cells or nil if no rectangle found.
    def get_rectangle(nw)
      require 'pry'; binding.pry
      ne = find_corner_ne(nw)
      se = find_corner_se(ne)
      sw = find_corner_sw(se)
      nw = find_corner_nw(sw)

    end

    def find_corner_ne(nw)
      return nil if nw.figure != [:corner, :north_west]
      x = nw.x+1
      y = nw.y

      while x < @grid.width
        cell = @grid.get(x,y)
        if cell.figure == [:corner, :north_east]
          return cell
        end
        x+=1
      end
      nil
    end

    def find_corner_se(ne)
      return nil if ne.figure != [:corner, :north_east] 
      x = ne.x
      y = ne.y+1

      while y < @grid.width
        cell = @grid.get(x,y)
        if cell.figure == [:corner, :south_east]
          return cell
        end
        y+=1
      end
      nil
    end

    def find_corner_sw(se)
     return nil if se.figure != [:corner, :south_east] 
     x = se.x-1
     y = se.y

     while x > 0
       cell = @grid.get(x,y)
       if cell.figure == [:corner, :south_west]
         return cell
       end
       x-=1
     end
     nil
    end

    def find_corner_nw(sw)
      return nil if sw.figure != [:corner, :south_west]
      x = sw.x
      y = sw.y-1

      while y > 0
        cell = @grid.get(x,y)
        if cell.figure == [:corner, :north_west]
          return cell
        end
        y-=1
      end
      nil
    end

  end
end
