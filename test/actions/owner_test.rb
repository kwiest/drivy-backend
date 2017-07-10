require 'minitest/autorun'
require 'actions/owner'

class OwnerActionTest < MiniTest::Test
  # the owner receives the rental price minus the commission

  def setup
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 400 }
    commission = OpenStruct.new commission_amount: 900

    @action = OwnerAction.new rental, commission
  end

  def test_who
    assert_equal :owner, @action.who
  end

  def test_action_type
    assert_equal :credit, @action.type
  end

  def test_amount
    assert_equal 2100, @action.amount
  end
end
