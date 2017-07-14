require 'json'
require 'byebug'

require 'action_aggregator'
require 'action_combiner'
require 'car_collection'
require 'commission'
require 'rental_calculator'
require 'rental_collection'
require 'rental_modification'
require 'rental_modification_collection'

class Level6
  attr_accessor :cars, :rentals, :rental_modifications

  def initialize
    json_data = JSON.parse(File.read("lib/level6/data.json"))
    @cars = CarCollection.new json_data["cars"]
    @rentals = RentalCollection.new json_data["rentals"]
    @rental_modifications = RentalModificationCollection.new json_data["rental_modifications"]
  end

  def to_json
    { "rental_modifications" => rental_modifications_json }.to_json
  end


  private

  def rental_modifications_json
    rental_modifications.map do |modification|
      rental = rentals.find_by_id modification.rental_id
      modified_rental = modification.build_modified rental
      car = cars.find_by_id rental.car_id

      original_calculator = RentalCalculator.new rental: rental, car: car
      original_commission = Commission.new original_calculator.total_price, rental.time
      original_actions = ActionAggregator.new(original_calculator, original_commission).to_a

      modified_calculator = RentalCalculator.new rental: modified_rental, car: car
      modified_commission = Commission.new modified_calculator.total_price, modified_rental.time
      modified_actions = ActionAggregator.new(modified_calculator, modified_commission).to_a

      updated_actions = original_actions.zip(modified_actions).map do |action_pair|
        ActionCombiner.new(action_pair[0], action_pair[1]).combine
      end

      {
        id: modification.id,
        rental_id: rental.id,
        actions: updated_actions.map(&:to_h)
      }
    end
  end
end
