require 'actions/assistance'
require 'actions/driver'
require 'actions/drivy'
require 'actions/insurance'
require 'actions/owner'

class ActionAggregator
  ACTIONS = [
    AssistanceAction,
    DriverAction,
    DrivyAction,
    InsuranceAction,
    OwnerAction
  ].freeze

  attr_accessor :calculator, :commission

  def initialize(calculator, commission)
    @calculator = calculator
    @commission = commission
  end

  def to_a
    ACTIONS.map { |klass| klass.create(calculator, commission) }
  end
end
