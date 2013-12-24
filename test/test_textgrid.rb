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
        assert_equal @grid.maxwidth, 35
        assert_equal @grid.maxheight, 4 
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
        cell = Textcell.new(0,0)
        cell2 = Textcell.new(24,2)
        cell3 = Textcell.new(16,1)
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

    context "figure check" do
      setup do
        @grid = Textgrid.new(@input)
        @cell_corner = Textcell.new(0,0)
        @cell_hline = Textcell.new(1,0)
        @cell_vline = Textcell.new(0,1)
        @cell_arrow_w = Textcell.new(16,1)
        @cell_blank = Textcell.new(1,1)
      end 

      should "recognize a corner" do
        assert_equal [true, :north_west], @grid.is_figure(@cell_corner, :corner)
      end

      should "recognize a horizontal line" do
        assert_equal [true, :horizontal], @grid.is_figure(@cell_hline, :line)
      end

      should "recognize a vertical line" do
        assert_equal [true, :vertical], @grid.is_figure(@cell_vline, :line)
      end

      should "recognize a west arrow" do 
        assert_equal [true, :west], @grid.is_figure(@cell_arrow_w, :arrow)
      end

      should "recognize a blank field" do
        assert_equal [true, :all], @grid.is_figure(@cell_blank, :blank)
      end
    end

    context "corner types" do
      setup do
        @grid = Textgrid.new(@input)
        @nw = Textcell.new(0,0)
        @ne = Textcell.new(14,0)
        @se = Textcell.new(14,3)
        @sw = Textcell.new(0,3)
        @no = Textcell.new(99,99)
      end

      should "recognize all corners" do
        assert_equal [true, :north_west], @grid.is_figure(@nw, :corner)
        assert_equal [true, :north_east], @grid.is_figure(@ne, :corner)
        assert_equal [true, :south_east], @grid.is_figure(@se, :corner)
        assert_equal [true, :south_west], @grid.is_figure(@sw, :corner)
        assert_equal [false, nil], @grid.is_figure(@no, :corner)
      end

    end
  end
end
