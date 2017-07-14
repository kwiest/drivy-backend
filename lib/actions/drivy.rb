require 'action'

class DrivyAction < Action
  def self.create(calculator, commission)
    amount = calculator.options[:deductible_reduction] + commission.drivy_fee
    new(:drivy, :credit, amount)
  end
end
