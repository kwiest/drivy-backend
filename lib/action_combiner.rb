class ActionCombiner
  class WhoMismatchError < Exception; end

  attr_accessor :original, :updated

  def initialize(original, updated)
    raise WhoMismatchError unless original.who == updated.who
    @original = original
    @updated = updated
  end

  def combine
    updated - original
  end
end
