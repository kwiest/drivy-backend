require 'minitest/autorun'
require 'actions/assistance'

class AssistanceActionTest < MiniTest::Test
  # the assistance receives its part of the commission

  def setup
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 400 }
    commission = OpenStruct.new assistance_fee: 100

    @action = AssistanceAction.new rental, commission
  end

  def test_who
    assert_equal :assistance, @action.who
  end

  def test_action_type
    assert_equal :credit, @action.type
  end

  def test_amount
    assert_equal 100, @action.amount
  end
end
