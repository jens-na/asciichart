require 'helper'

class TestLayer < Test::Unit::TestCase

  context "A layer" do
    setup do
      @input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
      @grid = Textgrid.new(@input)
      @layer = @grid.root
    end

    context "checks if cells exist" do
      setup do
        @cell1 = @layer.include?(Textcell.new(2,2))
        @cell2 = @layer.include?(Textcell.new(99,99))
      end

      should "return true if cell is valid" do
        assert_equal true, @cell1
        assert_equal false, @cell2
      end
    end
  end
end
