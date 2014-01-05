require 'helper'

class TestRectangle < Test::Unit::TestCase

  context "A rectangle" do
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
      @rectangle = Rectangle.new(0,0,14,13)
    end

    context "check if cell is included" do
      should "check if included" do
        assert_equal true, @rectangle.include?(1,1)
        assert_equal true, @rectangle.include?(14,5)
        assert_equal false, @rectangle.include?(15,7) 
      end
    end

    context "check if cell is inside" do
      should "check if inside" do
        assert_equal true, @rectangle.inside?(1,1)
        assert_equal false, @rectangle.inside?(14,5)
        assert_equal false, @rectangle.inside?(15,7) 
      end
    end
  end
end
