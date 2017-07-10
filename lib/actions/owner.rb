require 'action'

class OwnerAction < Action
  def who
    :owner
  end

  def type
    :credit
  end

  def amount
    calculator.total_price - commission.commission_amount
  end
end
