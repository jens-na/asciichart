require 'helper'

class TestTextcell < Test::Unit::TestCase

  context "A textcell" do
    setup do
      @cell0 = Textcell.new(0,0)
      @cell = Textcell.new(5,5)
    end

    context "calculate other cells" do
      setup do
        @cell_north = @cell.north
        @cell_south = @cell.south
        @cell_west = @cell.west
        @cell_east = @cell.east
        @cell_north_east = @cell.north_east
        @cell_north_west = @cell.north_west
        @cell_south_east = @cell.south_east
        @cell_south_west = @cell.south_west

        @cell0_north = @cell0.north
      end

      should "calc coordinates (compass style) correctly" do
        assert_equal 4, @cell_north.y
        assert_equal 5, @cell_north.x

        assert_equal 6, @cell_south.y
        assert_equal 5, @cell_south.x

        assert_equal 5, @cell_west.y
        assert_equal 4, @cell_west.x

        assert_equal 5, @cell_east.y
        assert_equal 6, @cell_east.x

        assert_equal 4, @cell_north_east.y
        assert_equal 6, @cell_north_east.x

        assert_equal 4, @cell_north_west.y
        assert_equal 4, @cell_north_west.x

        assert_equal 6, @cell_south_east.y
        assert_equal 6, @cell_south_east.x

        assert_equal 6, @cell_south_west.y
        assert_equal 4, @cell_south_west.x
      end

      should "calc north cell correctly" do
        assert_equal nil, @cell0_north
      end
    end

    context "check for equality" do
      setup do
        @cell1 = Textcell.new(12,14)
        @cell2 = Textcell.new(12,13)
        @cell3 = Textcell.new(14,12)
        @cell4 = Textcell.new(12,14)
      end

      should "check for equality with ==" do
        assert_equal false, @cell1 == @cell2
        assert_equal false, @cell1 == @cell3
        assert_equal true, @cell1 == @cell4
      end

      should "check for equality with eql?" do
        assert_equal false, @cell1.eql?(@cell2)
        assert_equal false, @cell1.eql?(@cell3)
        assert_equal true, @cell1.eql?(@cell4)
      end
    end
  end
end
