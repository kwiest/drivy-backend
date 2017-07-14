require 'actions/action_test'
require 'actions/assistance'

class AssistanceActionTest < ActionTest
  # the assistance receives its part of the commission

  def setup
    @action = AssistanceAction.create calculator_mock, commission_mock
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
