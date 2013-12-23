require 'helper'

class TestParser < Test::Unit::TestCase

  context "A parser" do
    setup do
      @input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
    
      @grid = Textgrid.new(@input)
      @parser = Parser.new(@grid, Options::OPTIONS)
    end

    context "check blank cells" do
      setup do
        @cell0 = Textcell.new(0,0)
        @cell1 = Textcell.new(1,1)
        @cell2 = Textcell.new(99,99)
      end

      should "check for blank cells in grid" do
        assert_equal false, @parser.is_blank?(@cell0)
        assert_equal true, @parser.is_blank?(@cell1)
        assert_equal true, @parser.is_blank?(@cell2)
      end

    end

    context "recognize horizontal line" do
      setup do
        input = <<INPUT

     ---------->

INPUT
      end

      should "parse the line" do

      end
    end

    context "recognize vertical line" do
      setup do
        input = <<INPUT

      ^
      |
      |
      |

INPUT
      end
    end

  end
end
