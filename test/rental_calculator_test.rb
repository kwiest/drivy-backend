require 'minitest/autorun'
require 'json'
require 'rental_calculator'
require 'car_collection'
require 'rental_collection'

class RentalCalculatorTest < MiniTest::Test
  def setup
    @car = Car.new id: 1, price_per_day: 2000, price_per_km: 10
    @rental = Rental.new id: 1, car_id: 1, start_date: "2017-7-3",
      end_date: "2017-7-14", distance: 1000

    @calculator = RentalCalculator.new(rental: @rental, car: @car)
  end

  def test_time_price
    assert_equal 17800, @calculator.time_price
  end

  def test_distance_price
    assert_equal 10000, @calculator.distance_price
  end

  def test_total_price
    assert_equal 27800, @calculator.total_price
  end
end
