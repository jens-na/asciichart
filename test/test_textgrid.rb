require 'helper'

class TestChart < Test::Unit::TestCase

  context "A textgrid" do

    context "calculate length and height of textgrid" do
      setup do
        input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
        @grid = Textgrid.new(input)

      end

      should "have correct dimensions" do
        assert_equal 35, @grid.width
        assert_equal 4, @grid.height 
      end
    end

    context "checks if cells exist" do
      setup do
        input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
        grid = Textgrid.new(input)
        @cell1 = grid.cell_exists?(Textcell.new(2,2))
        @cell2 = grid.cell_exists?(Textcell.new(99,99))
      end

      should "return true if cell is valid" do
        assert_equal @cell1, true
        assert_equal @cell2, false
      end
    end
  end
end
