require 'actions/action_test'
require 'actions/insurance'

class InsuranceActionTest < ActionTest
  # the insurance receives its part of the commission

  def setup
    @action = InsuranceAction.create calculator_mock, commission_mock
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
