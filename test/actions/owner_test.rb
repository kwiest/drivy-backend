require 'actions/action_test'
require 'actions/owner'

class OwnerActionTest < ActionTest
  # the owner receives the rental price minus the commission

  def setup
    @action = OwnerAction.create calculator_mock, commission_mock
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
