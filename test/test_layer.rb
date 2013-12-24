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

    context "loop through layer with each" do
      setup do
        @cell1 = Textcell.new(0,0)
        @cell2 = Textcell.new(1,0)
        
        @cells = Array.new
        sublayer = Layer.new
        sublayer.add(@cell1)
        sublayer.add(@cell2)
  
        sublayer.each do |cell|
          @cells.push(cell)
        end
      end

      should "contain similar cells" do
        assert_equal @cell1, @cells[0]
        assert_equal @cell2, @cells[1]
      end
    end
  end
end
