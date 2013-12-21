require 'helper'

class TestChart < Test::Unit::TestCase

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

    context "checks if cells exist" do
      setup do
        grid = Textgrid.new(@input)
        @cell1 = grid.cell_exists?(Textcell.new(2,2))
        @cell2 = grid.cell_exists?(Textcell.new(99,99))
      end

      should "return true if cell is valid" do
        assert_equal true, @cell1
        assert_equal false, @cell2
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
  end
end
