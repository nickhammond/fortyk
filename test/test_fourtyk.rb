require 'helper'

class TestFourtyk < Test::Unit::TestCase
  context "default shorten number examples" do
    EXAMPLES.each do |example|
      should "convert #{example[0]} to #{example[1]}" do
        assert_equal example[0].shorten_number, example[1]
      end
    end    
  end
  context "currency" do
    should "put the $ sign in front" do
      assert_equal 4000.shorten_money, "$4K"
      assert_equal 4000.shorten_money(:currency => "$"), "$4K"
    end
    
    should "put the # sign in front" do
      assert_equal 4000.shorten_money(:currency => "#"), "#4K"
    end
    
    should "display 1 point" do 
      assert_equal 4100.shorten_money, "$4.1K"
    end
  end
  context "precision" do
    should "display 1 point" do
      assert_equal 4100.shorten_number, "4.1K"
    end
    should "display 0 points" do 
      assert_equal 4000.shorten_number, "4K"
    end
  end
end
