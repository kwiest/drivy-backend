require 'minitest/autorun'
require 'time_discount'

class TimeDiscountTest < MiniTest::Test
  def setup
    @price_per_day = 100
  end

  def test_ten_percent_discount
    days = 2
    assert_equal 90, TimeDiscount.new(@price_per_day, days).apply
  end

  def test_thirty_percent
    days = 5
    assert_equal 70, TimeDiscount.new(@price_per_day, days).apply
  end

  def test_fifty_percent
    days = 11
    assert_equal 50, TimeDiscount.new(@price_per_day, days).apply
  end

  def test_fall_through_original_price
    days = 1
    assert_equal 100, TimeDiscount.new(@price_per_day, days).apply
  end
end
