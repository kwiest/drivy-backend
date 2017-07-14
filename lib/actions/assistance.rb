require 'action'

class AssistanceAction < Action
  def self.create(calculator, commission)
    new(:assistance, :credit, commission.assistance_fee)
  end
end
