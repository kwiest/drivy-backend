require 'json'

require 'car_collection'
require 'rental_collection'
require 'rental_calculator'
require 'commission'
require 'actions/assistance'
require 'actions/driver'
require 'actions/drivy'
require 'actions/insurance'
require 'actions/owner'

class Level5
  attr_accessor :cars, :rentals

  def initialize
    json_data = JSON.parse(File.read("lib/level5/data.json"))
    @cars = CarCollection.new json_data["cars"]
    @rentals = RentalCollection.new json_data["rentals"]
  end

  def to_json
    output = { "rentals" => [] }
    @rentals.each do |rental|
      car = @cars.find_by_id(rental.car_id)
      calculator = RentalCalculator.new(rental: rental, car: car)
      commission = Commission.new(calculator.total_price, rental.time)

      hash = { id: rental.id,
        actions: [
          DriverAction.new(calculator, commission).to_h,
          OwnerAction.new(calculator, commission).to_h,
          InsuranceAction.new(calculator, commission).to_h,
          AssistanceAction.new(calculator, commission).to_h,
          DrivyAction.new(calculator, commission).to_h
        ]
      }
      output["rentals"] << hash
    end
    output.to_json
  end
end
