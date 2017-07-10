require 'minitest/autorun'
require 'actions/insurance'

class InsuranceActionTest < MiniTest::Test
  # the insurance receives its part of the commission

  def setup
    rental = OpenStruct.new total_price: 3000, options: { deductible_reduction: 400 }
    commission = OpenStruct.new insurance_fee: 450

    @action = InsuranceAction.new rental, commission
  end

  def test_who
    assert_equal :insurance, @action.who
  end

  def test_action_type
    assert_equal :credit, @action.type
  end

  def test_amount
    assert_equal 450, @action.amount
  end
end
