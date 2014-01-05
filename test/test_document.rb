require 'helper'

class TestDocument < Test::Unit::TestCase

  context "A document" do
    setup do
      @input = <<INPUT
+----------+  +----------+
| Test     |  | Test     |
|          |  |          |
|          |  |          |
+----------+  +----------+

+----------+  +----------+
| Test     |  | Test     |
|          |  |          |
|          |  |          |
+----------+  +----------+

+----------+  +----------+
| Test     |  | Test     |
|          |  |          |
|          |  |          |
+----------+  +----------+
INPUT

      @document = Document.new(@input)
      obj = @document.to_png
    end

    context "document parsed" do
      should "not be empty" do
      end
    end
  end
end
