require 'helper'

class TestGridParser < Test::Unit::TestCase

  context "A gridparser" do
    setup do
      @input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|  +----+     |         +---------+
|  |    |     |
|  |    |     |
|  +----+     |
|     |       |
|     +--+    |
|        |    |
| +---+  |    |
| |   |--+    |
| +---+       |
|             |
+-------------+
INPUT
      @grid = Textgrid.new(@input)
      @parser = GridParser.new(@grid)
    end

    context "count rectangles" do
      setup do
          @rects = @parser.get_rectangles(@grid.cells)
      end

      should "return a correct number" do
        assert_equal 2, @rects.count
      end
    end

    context "include rectangle check" do
      setup do
        @cell = @grid.get(1,1)
        @cell1 = @grid.get(14,5)
        @cell2 = @grid.get(15,7)
        @rects = @parser.get_rectangles(@grid.cells)
      end

      should "check if cell included" do
        assert_equal true, @parser.in_rectangle(@cell, @rects)
        assert_equal true, @parser.in_rectangle(@cell1, @rects)
        assert_equal false, @parser.in_rectangle(@cell2, @rects)
      end
    end

    context "parser check" do
      setup do
        @parser.parse
      end

      should "asd" do

      end
      
    end
  end
end
