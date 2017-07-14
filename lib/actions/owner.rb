require 'action'

class OwnerAction < Action
  def self.create(calculator, commission)
    amount = calculator.total_price - commission.amount
    new(:owner, :credit, amount)
  end
end
