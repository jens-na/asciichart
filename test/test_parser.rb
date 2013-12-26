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
      @parser = Parser.new(@grid)
      @root = @grid.root
    end

    context "follow figures" do
      setup do
        from_rule = [:line, :horizontal]
        to_rule = [:corner, :north_east]
        sublayer = @root.get_sublayer(Textcell.new(0,0), :east)
        @cells = @parser.follow_figure(sublayer, from_rule, to_rule)
        
        expected = %w[
          1,0
          2,0
          3,0
          4,0
          5,0
          6,0
          7,0
          8,0
          9,0
          10,0
          11,0
          12,0
          13,0
        ]
        @expected_cells = Textcell.create_multiple(expected)
      end

      should "return correct cells until north east corner" do
        require 'pry'; binding.pry
        assert_equal @expected_cells, @cells
      end
    end
  end
end
