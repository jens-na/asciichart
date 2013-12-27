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
        @cells = @parser.follow_figure(sublayer, from_rule, to_rule, :east)
        
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
        assert_equal @expected_cells, @cells
      end
    end

    context "get areas from layer" do
      setup do
        @areas = @parser.get_areas(@root)
        @area0 = %w[
          0,0
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
          14,0
          14,1
          14,2
          14,3
          13,3
          12,3
          11,3
          10,3
          9,3
          8,3
          7,3
          6,3
          5,3
          4,3
          3,3
          2,3
          1,3
          0,3 
          0,2
          0,1
        ]

        @area1 = %w[
          24,0
          25,0
          26,0
          27,0
          28,0
          29,0
          30,0
          31,0
          32,0
          33,0
          34,0
          34,1
          34,2
          33,2
          32,2
          31,2
          30,2
          29,2
          28,2
          27,2
          26,2
          25,2
          24,2
          24,1
        ]
        @expected_area0 = Textcell.create_multiple(@area0)
        @expected_area1 = Textcell.create_multiple(@area1)
      end
      should "determine first area" do
        assert_equal @expected_area0, @areas[0].cells
      end
      should "determine second area" do
        assert_equal @expected_area1, @areas[1].cells
      end
    end
  end
end
