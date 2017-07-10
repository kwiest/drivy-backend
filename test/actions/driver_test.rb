require 'minitest/autorun'
require 'actions/driver'

class DriverActionTest < MiniTest::Test
  # the driver must pay the rental price and the (optional) deductible reduction

  def setup
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 400 }
    commission = OpenStruct.new

    @action = DriverAction.new rental, commission
  end

  def test_who
    assert_equal :driver, @action.who
  end

  def test_action_type
    assert_equal :debit, @action.type
  end

  def test_amount
    assert_equal 3400, @action.amount
  end

  def test_amount_without_deductible_reduction
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 0 }
    commission = OpenStruct.new
    action = DriverAction.new rental, commission

    assert_equal 3000, action.amount
  end
end
