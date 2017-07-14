require 'minitest/autorun'

class ActionTest < MiniTest::Test
  def calculator_mock
    OpenStruct.new total_price: 3000, options: { deductible_reduction: 400 }
  end

  def commission_mock
    OpenStruct.new amount: 900, assistance_fee: 100, insurance_fee: 450, drivy_fee: 350
  end

  def test_equals
    a = Action.new :owner, :credit, 100
    b = Action.new :owner, :credit, 100
    c = Action.new :owner, :credit, 50

    assert_equal a, b
    refute_equal a, c
  end

  def test_subtraction_of_credits
    a = Action.new :owner, :credit, 100
    b = Action.new :owner, :credit, 500

    assert_equal Action.new(:owner, :debit, 400), (a - b)
    assert_equal Action.new(:owner, :credit, 400), (b - a)
  end

  def test_subtraction_of_debits
    a = Action.new :owner, :debit, 100
    b = Action.new :owner, :debit, 500

    assert_equal Action.new(:owner, :credit, 400), (a - b)
    assert_equal Action.new(:owner, :debit, 400), (b - a)
  end

  def test_subtraction_of_mixed
    a = Action.new :owner, :credit, 100
    b = Action.new :owner, :debit, 500

    assert_equal Action.new(:owner, :credit, 600), (a - b)
    assert_equal Action.new(:owner, :debit, 600), (b - a)
  end
end
