require 'time_discount'

class RentalCalculator
  attr_accessor :car, :rental

  def initialize(rental:, car:)
    @rental = rental
    @car = car
  end

  def total_price
    (time_price + distance_price)
  end

  def time_price
    (1..rental.time).inject(0) do |total_price, day|
      total_price += TimeDiscount.new(car.price_per_day, day).apply
    end
  end

  def distance_price
    rental.distance * car.price_per_km
  end

  def options
    rental.options.inject({}) do |opts,(k,v)|
      opts[k] = v ? optional_charges[k] : 0
      opts
    end
  end


  private

  def optional_charges
    {
      deductible_reduction: (rental.time * 400)
    }
  end
end
