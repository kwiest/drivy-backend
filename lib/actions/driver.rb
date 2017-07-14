require 'action'

class DriverAction < Action
  def self.create(calculator, commission)
    amount = calculator.total_price + calculator.options[:deductible_reduction]
    new(:driver, :debit, amount)
  end
end
