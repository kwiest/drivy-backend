require 'minitest/autorun'
require 'actions/drivy'

class DrivyActionTest < MiniTest::Test
  # drivy receives its part of the commission, plus the deductible reduction

  def setup
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 400 }
    commission = OpenStruct.new drivy_fee: 350

    @action = DrivyAction.new rental, commission
  end

  def test_who
    assert_equal :drivy, @action.who
  end

  def test_action_type
    assert_equal :credit, @action.type
  end

  def test_amount
    assert_equal 750, @action.amount
  end

  def test_amount_without_deductible_reduction
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 0 }
    commission = OpenStruct.new drivy_fee: 350
    action = DrivyAction.new rental, commission

    assert_equal 350, action.amount
  end
end
