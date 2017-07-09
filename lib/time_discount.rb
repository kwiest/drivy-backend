class TimeDiscount
  attr_accessor :price_per_day, :day

  # price per day decreases by 10% after 1 day
  # price per day decreases by 30% after 4 days
  # price per day decreases by 50% after 10 days
  DISCOUNTS = {
    10 => 0.50,
    4  => 0.70,
    1  => 0.90,
    0  => 1
  }.freeze

  def initialize(price_per_day, day)
    @price_per_day = price_per_day
    @day = day
  end

  def apply
    DISCOUNTS.each do |threshold, discount|
      return (price_per_day * discount).to_i if day > threshold
    end
  end
end
