require 'minitest/autorun'
require 'action_combiner'

class ActionCombinerTest < MiniTest::Test
  def test_who_mistatch_raises
    original = Action.new :owner, :credit, 100
    updated = Action.new :driver, :debit, 100
    assert_raises ActionCombiner::WhoMismatchError do
      ActionCombiner.new original, updated
    end
  end

  def test_identical_actions
    original = Action.new :owner, :credit, 100
    assert_equal original, ActionCombiner.new(original, original).combine
  end

  # Credits
  def test_updated_credit_is_less_than_original
    original = Action.new :owner, :credit, 100
    updated = Action.new :owner, :credit, 50

    expected = Action.new :owner, :debit, 50
    assert_equal expected, ActionCombiner.new(original, updated).combine
  end

  def test_updated_credit_is_more_than_original
    original = Action.new :owner, :credit, 50
    updated = Action.new :owner, :credit, 100

    expected = Action.new :owner, :credit, 50
    assert_equal expected, ActionCombiner.new(original, updated).combine
  end

  # Debits
  def test_updated_debit_is_less_than_original
    original = Action.new :driver, :debit, 100
    updated = Action.new :driver, :debit, 50

    expected = Action.new :driver, :credit, 50
    assert_equal expected, ActionCombiner.new(original, updated).combine
  end

  def test_updated_debit_is_more_than_original
    original = Action.new :driver, :debit, 50
    updated = Action.new :driver, :debit, 100

    expected = Action.new :driver, :debit, 50
    assert_equal expected, ActionCombiner.new(original, updated).combine
  end
end
