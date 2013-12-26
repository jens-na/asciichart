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

    context "get northern cells" do
      setup do
        cell = Textcell.new(0,3)
        @northern = @layer.get_sublayer(cell, :north)
        
        expected_cells = %w[
          0,0
          0,1
          0,2
        ]
        @expected = Layer.new
        @expected.add_all(Textcell.create_multiple(expected_cells))
      end

      should "return northern cells" do
        assert_equal @expected.cells, @northern.cells
      end
    end

    context "get southern cells" do
      setup do
        cell = Textcell.new(0,0)
        @southern = @layer.get_sublayer(cell, :south)
        
        expected_cells = %w[
          0,1
          0,2
          0,3
        ]
        @expected = Layer.new
        @expected.add_all(Textcell.create_multiple(expected_cells))
      end

      should "return southern cells" do
        assert_equal @expected.cells, @southern.cells
      end
    end

    context "get eastern cells" do
      setup do
        cell = Textcell.new(24,2)
        @eastern = @layer.get_sublayer(cell, :east)
        
        expected_cells = %w[
          25,2
          26,2
          27,2
          28,2
          29,2
          30,2
          31,2
          32,2
          33,2
          34,2
        ]
        @expected = Layer.new
        @expected.add_all(Textcell.create_multiple(expected_cells))
      end

      should "return western cells" do
        assert_equal @expected.cells, @eastern.cells
      end
    end

    context "get western cells" do
      setup do
        cell = Textcell.new(5,3)
        @western = @layer.get_sublayer(cell, :west)

        expected_cells = %w[
          0,3
          1,3
          2,3
          3,3
          4,3
        ] 
        @expected = Layer.new
        @expected.add_all(Textcell.create_multiple(expected_cells))
      end
      
      should "return eastern cells" do
        assert_equal @expected.cells, @western.cells
      end
    end
  end
end
