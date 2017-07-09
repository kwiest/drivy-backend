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
    rental.time * car.price_per_day
  end

  def distance_price
    rental.distance * car.price_per_km
  end
end
