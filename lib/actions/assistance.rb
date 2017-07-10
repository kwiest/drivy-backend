require 'action'

class AssistanceAction < Action
  def who
    :assistance
  end

  def type
    :credit
  end

  def amount
    commission.assistance_fee
  end
end
