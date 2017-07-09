require 'json'

require 'car_collection'
require 'rental_collection'
require 'rental_calculator'
require 'commission'

class Level3
  attr_accessor :cars, :rentals

  def initialize
    json_data = JSON.parse(File.read("lib/level3/data.json"))
    @cars = CarCollection.new json_data["cars"]
    @rentals = RentalCollection.new json_data["rentals"]
  end

  def to_json
    output = { "rentals" => [] }
    @rentals.each do |rental|
      car = @cars.find_by_id(rental.car_id)
      calculator = RentalCalculator.new(rental: rental, car: car)
      commission = Commission.new(calculator.total_price, rental.time)

      hash = { id: rental.id, price: calculator.total_price, commission: commission.to_h }
      output["rentals"] << hash
    end
    output.to_json
  end
end
