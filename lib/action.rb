class Action
  class WhoMismatchError < Exception; end

  attr_accessor :who, :type, :amount

  def initialize(who, type, amount)
    @who = who
    @type = type
    @amount = amount
  end

  def to_h
    {
      who: who,
      type: type,
      amount: amount
    }
  end

  def ==(other)
    (who == other.who) && (type == other.type) && (amount == other.amount)
  end

  def -(other)
    raise WhoMismatchError unless who == other.who
    return self.class.new(who, type, amount) if self == other

    if type == :credit && other.type == :credit
      difference = amount - other.amount
    elsif type == :credit && other.type == :debit
      difference = amount + other.amount
    elsif type == :debit && other.type == :debit
      difference = (amount - other.amount) * -1
    elsif type == :debit && other.type == :credit
      difference = (amount + other.amount) * -1
    end

    difference > 0 ? self.class.new(who, :credit, difference) :
      self.class.new(who, :debit, difference.abs)
  end
end
