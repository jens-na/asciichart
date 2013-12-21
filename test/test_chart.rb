require 'helper'

class TestChart < Test::Unit::TestCase

  context "A chart" do

    context "calculate length and height of chart" do
      setup do
        input = <<INPUT
+-------------+         +---------+
|             | <------ | Test    |
|             |         +---------+
+-------------+
INPUT
        @chart = Chart.new(input)
      end

      should "have correct dimensions" do
        assert_equal 35, @chart.width
        assert_equal 4, @chart.height 
      end
    end
  end
end
