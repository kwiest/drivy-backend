class Action
  attr_accessor :calculator, :commission

  def initialize(calculator, commission)
    @calculator = calculator
    @commission = commission
  end

  def to_h
    {
      who: who,
      type: type,
      amount: amount
    }
  end
end
