require 'minitest/autorun'
require 'commission'

class CommissionTest < MiniTest::Test
  def setup
    @rental_price = 3000
    @days = 1
    @commission = Commission.new(@rental_price, @days)
  end

  def test_insurance_fee
    assert_equal 450, @commission.insurance_fee
  end

  def test_assistance_fee
    assert_equal 100, @commission.assistance_fee
  end

  def test_drivy_fee
    assert_equal 350, @commission.drivy_fee
  end
end
