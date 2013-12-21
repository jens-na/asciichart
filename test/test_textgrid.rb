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
  end
end
