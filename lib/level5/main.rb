require 'json'

require 'action_aggregator'
require 'car_collection'
require 'commission'
require 'rental_collection'
require 'rental_calculator'

class Level5
  attr_accessor :cars, :rentals

  def initialize
    json_data = JSON.parse(File.read("lib/level5/data.json"))
    @cars = CarCollection.new json_data["cars"]
    @rentals = RentalCollection.new json_data["rentals"]
  end

  def to_json
    { "rentals" => rentals_json }.to_json
  end


  private

  def rentals_json
    rentals.map do |rental|
      car = cars.find_by_id rental.car_id
      calculator = RentalCalculator.new rental: rental, car: car
      commission = Commission.new calculator.total_price, rental.time
      actions = ActionAggregator.new(calculator, commission).to_a

      {
        id: rental.id,
        actions: actions.map(&:to_h)
      }
    end
  end
end
