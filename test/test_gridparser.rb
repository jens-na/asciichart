require 'helper'

class TestGridParser < Test::Unit::TestCase

  context "A gridparser" do
    setup do
      @input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
      @grid = Textgrid.new(@input)
      @parser = GridParser.new(@grid)
    end

    context "parse grid" do
      setup do
        @parser.parse
      end

      should "parse the grid" do

      end
    end
  end
end
