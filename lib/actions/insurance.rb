require 'action'

class InsuranceAction < Action
  def self.create(calculator, commission)
    new(:insurance, :credit, commission.insurance_fee)
  end
end
