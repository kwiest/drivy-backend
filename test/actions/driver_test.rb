require 'actions/action_test'
require 'actions/driver'

class DriverActionTest < ActionTest
  # the driver must pay the rental price and the (optional) deductible reduction

  def setup
    @action = DriverAction.create calculator_mock, commission_mock
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
    calc = OpenStruct.new total_price: 3000, options: { deductible_reduction: 0 }
    action = DriverAction.create calc, commission_mock

    assert_equal 3000, action.amount
  end
end
