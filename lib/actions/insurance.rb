require 'action'

class InsuranceAction < Action
  def who
    :insurance
  end

  def type
    :credit
  end

  def amount
    commission.insurance_fee
  end
end
