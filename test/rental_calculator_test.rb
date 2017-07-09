require 'minitest/autorun'
require 'json'
require 'rental_calculator'
require 'car_collection'
require 'rental_collection'

class RentalCalculatorTest < MiniTest::Test
  def setup
    json_data = JSON.parse(File.read("lib/level1/data.json"))
    @cars = CarCollection.new json_data["cars"]
    @rentals = RentalCollection.new json_data["rentals"]

    rental = @rentals.find_by_id(1)
    car = @cars.find_by_id(rental.car_id)
    @calculator = RentalCalculator.new(rental: rental, car: car)
  end

  def test_time_price
    # car.price_per_day: 2000, rental.time : 3
    assert_equal 6000, @calculator.time_price
  end

  def test_distance_price
    # car.price_per_km: 10, rental.distance: 100
    assert_equal 1000, @calculator.distance_price
  end

  def test_total_price
    output = JSON.parse(File.read("lib/level1/output.json"))
    output["rentals"].each do |r|
      rental = @rentals.find_by_id(r["id"])
      car = @cars.find_by_id(rental.car_id)
      calculator = RentalCalculator.new(rental: rental, car: car)

      assert_equal r["price"], calculator.total_price
    end
  end
end
