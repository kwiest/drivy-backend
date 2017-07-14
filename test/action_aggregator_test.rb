require 'actions/action_test'
require 'action_aggregator'

class ActionAggregatorTest < ActionTest
  def test_to_a
    aggregator = ActionAggregator.new calculator_mock, commission_mock
    assert_equal 5, aggregator.to_a.length
  end
end
