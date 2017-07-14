require 'actions/action_test'
require 'actions/drivy'

class DrivyActionTest < ActionTest
  # drivy receives its part of the commission, plus the deductible reduction

  def setup
    @action = DrivyAction.create calculator_mock, commission_mock
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
    calc = OpenStruct.new total_price: 3000, options: { deductible_reduction: 0 }
    action = DrivyAction.create calc, commission_mock

    assert_equal 350, action.amount
  end
end
