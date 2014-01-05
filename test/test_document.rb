require 'helper'

class TestDocument < Test::Unit::TestCase

  context "A document" do
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
      @document = Document.new(@input)
      @document.to_png
    end

    context "document parsed" do
      should "not be empty" do
      end
    end
  end
end
