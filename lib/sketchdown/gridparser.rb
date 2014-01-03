module Sketchdown

  class GridParser

    def initialize(grid, options = {})
      @grid = grid
      @options = options
    end

    def parse
      for e in @grid.cells
        if e.figure == [:corner, :north_west]
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
      nw_ne = find_corner_ne(nw)
      ne_se = find_corner_se(nw_ne[-1])
      se_sw = find_corner_sw(ne_se[-1])
      sw_nw = find_corner_nw(se_sw[-1])

      if nw == sw_nw[-1]
        populate_rectangle(nw_ne,ne_se,se_sw,sw_nw)
      end
    end

    def find_corner_ne(nw)
      return nil if nw.figure != [:corner, :north_west]
      cells = []
      x = nw.x+1
      y = nw.y

      cells.push(nw)
      while x <= @grid.width
        cell = @grid.get(x,y)
        cells.push(cell)
        if cell.figure == [:corner, :north_east]
          return cells
        end
        x+=1
      end
      nil
    end

    def find_corner_se(ne)
      return nil if ne.figure != [:corner, :north_east]
      cells = []
      x = ne.x
      y = ne.y+1

      cells.push(ne)
      while y <= @grid.width
        cell = @grid.get(x,y)
        cells.push(cell)
        if cell.figure == [:corner, :south_east]
          return cells
        end
        y+=1
      end
      nil
    end

    def find_corner_sw(se)
     return nil if se.figure != [:corner, :south_east]
     cells = []
     x = se.x-1
     y = se.y

     cells.push(se)
     while x >= 0
       cell = @grid.get(x,y)
       cells.push(cell)
       if cell.figure == [:corner, :south_west]
         return cells
       end
       x-=1
     end
     nil
    end

    def find_corner_nw(sw)
      return nil if sw.figure != [:corner, :south_west]
      cells = []
      x = sw.x
      y = sw.y-1

      cells.push(sw)
      while y >= 0
        cell = @grid.get(x,y)
        cells.push(cell)
        if cell.figure == [:corner, :north_west]
          return cells
        end
        y-=1
      end
      nil
    end
    
    # Creates an rectangle from the specified corners
    #
    # nw_ne - the cells from nw corner to north east
    # ne_se - the cells from ne corner to south east
    # se_sw - the cells from south east corner to south west
    # sw_nw - the cells from south west corner to north west
    #
    # Returns a rectangle
    def populate_rectangle(nw_ne,ne_se,se_sw,sw_nw)
      x = nw_ne[0].x
      y = nw_ne[0].y
      width = nw_ne[-1].x-x
      height = ne_se[-1].y-y
      Rectangle.new(x,y,width,height)
    end

  end
end
