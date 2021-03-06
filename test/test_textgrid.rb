require 'helper'

class TestTextgrid < Test::Unit::TestCase

  context "A textgrid" do
    setup do
      @input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
    end

    context "calculate length and height of textgrid" do
      setup do
        @grid = Textgrid.new(@input)
      end

      should "have correct dimensions" do
        assert_equal @grid.width, 35
        assert_equal @grid.height, 4
      end
    end

    context "get textual representation in grid" do
      setup do
        grid = Textgrid.new(@input)
        cell1 = Textcell.new(0,0) # valid
        cell2 = Textcell.new(16,1) # valid
        cell3 = Textcell.new(15,3) # valid but nil
        cell4 = Textcell.new(99,99) # out of bounds
        @ch1 = grid.get_char(cell1)
        @ch2 = grid.get_char(cell2)
        @ch3 = grid.get_char(cell3)
        @ch4 = grid.get_char(cell4)
      end
      should "return corresponding chars" do
        assert_equal "+", @ch1
        assert_equal "<", @ch2
        assert_equal nil, @ch3
        assert_equal nil, @ch4
      end
    end

    context "get neighbors of the current cell" do
      setup do
        grid = Textgrid.new(@input)
        cell = Textcell.new(0,0,grid)
        cell2 = Textcell.new(24,2,grid)
        cell3 = Textcell.new(16,1,grid)
        @neighbors = grid.get_neighbors(cell)
        @neighbors2 = grid.get_neighbors_all(cell2)
        @neighbors3 = grid.get_neighbors_all(cell3)
      end

      should "return east and south cell" do
        assert_equal 1, @neighbors[:east].x
        assert_equal 0, @neighbors[:east].y

        assert_equal 0, @neighbors[:south].x
        assert_equal 1, @neighbors[:south].y
        
        assert_equal nil, @neighbors[:west]
        assert_equal nil, @neighbors[:north]
      end

      should "return cells correctly" do
        assert_equal 24, @neighbors2[:north].x
        assert_equal 1, @neighbors2[:north].y

        assert_equal 23, @neighbors2[:north_west].x
        assert_equal 1, @neighbors2[:north_west].y

        assert_equal 25, @neighbors2[:north_east].x
        assert_equal 1, @neighbors2[:north_east].y

        assert_equal 25, @neighbors2[:east].x
        assert_equal 2, @neighbors2[:east].y

        assert_equal 23, @neighbors2[:west].x
        assert_equal 2, @neighbors2[:west].y

        assert_equal nil, @neighbors2[:south]
        assert_equal nil, @neighbors2[:south_east]
        assert_equal nil, @neighbors2[:south_west]
      end

      should "return south cells correctly" do
        assert_equal 15, @neighbors3[:south_west].x
        assert_equal 2, @neighbors3[:south_west].y

        assert_equal 17, @neighbors3[:south_east].x
        assert_equal 2, @neighbors3[:south_east].y
      end
    end

    context "determine figure" do
      setup do
        @grid = Textgrid.new(@input)
        @figure1 = @grid.get_figure(Textcell.new(0,0,@grid))
      end

      should "determine a north west corner" do
        assert_equal [:corner, :north_west], @figure1
      end
    end

    context "figure check" do
      setup do
        @grid = Textgrid.new(@input)
        @cell_corner = Textcell.new(0,0,@grid)
        @cell_hline = Textcell.new(1,0,@grid)
        @cell_vline = Textcell.new(0,1,@grid)
        @cell_arrow_w = Textcell.new(16,1,@grid)
        @cell_blank = Textcell.new(1,1,@grid)
      end

      should "recognize a corner" do
        assert_equal [:corner, :north_west], @grid.get_figure(@cell_corner)
      end

      should "recognize a horizontal line" do
        assert_equal [:line, :horizontal], @grid.get_figure(@cell_hline)
      end

      should "recognize a vertical line" do
        assert_equal [:line, :vertical], @grid.get_figure(@cell_vline)
      end

      should "recognize a west arrow" do
        assert_equal [:arrowhead, :west], @grid.get_figure(@cell_arrow_w)
      end

      should "recognize a blank field" do
        assert_equal [:blank, :all], @grid.get_figure(@cell_blank)
      end
    end

    context "corner types" do
      setup do
        @grid = Textgrid.new(@input)
        @nw = Textcell.new(0,0,@grid)
        @ne = Textcell.new(14,0,@grid)
        @se = Textcell.new(14,3,@grid)
        @sw = Textcell.new(0,3,@grid)
        @no = Textcell.new(99,99,@grid)
      end

      should "recognize all corners" do
        assert_equal [:corner, :north_west], @grid.get_figure(@nw)
        assert_equal [:corner, :north_east], @grid.get_figure(@ne)
        assert_equal [:corner, :south_east], @grid.get_figure(@se)
        assert_equal [:corner, :south_west], @grid.get_figure(@sw)
        assert_equal [nil, nil], @grid.get_figure(@no)
      end

    end
  end
end
