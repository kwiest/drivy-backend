require 'action'

class DriverAction < Action
  def who
    :driver
  end

  def type
    :debit
  end

  def amount
    calculator.total_price + calculator.options[:deductible_reduction]
  end
end
