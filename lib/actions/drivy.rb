require 'action'

class DrivyAction < Action
  def who
    :drivy
  end

  def type
    :credit
  end

  def amount
    calculator.options[:deductible_reduction] + commission.drivy_fee
  end
end
