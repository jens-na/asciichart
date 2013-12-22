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
      end

      should "calc coordinates (compass style) correctly" do
        assert_equal @cell_north.y, 4
        assert_equal @cell_north.x, 5
        assert_equal @cell_south.y, 6
        assert_equal @cell_south.x, 5
        assert_equal @cell_west.y, 5
        assert_equal @cell_west.x, 4
        assert_equal @cell_east.y, 5
        assert_equal @cell_east.x, 6
        assert_equal @cell_north_east.y, 4
        assert_equal @cell_north_east.x, 6
        assert_equal @cell_north_west.y, 4
        assert_equal @cell_north_west.x, 4
        assert_equal @cell_south_east.y, 6
        assert_equal @cell_south_east.x, 6
        assert_equal @cell_south_west.y, 6
        assert_equal @cell_south_west.x, 4
      end
    end
  end
end
