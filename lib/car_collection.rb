require 'collection'
require 'car'
require 'byebug'

class CarCollection
  include Collection

  def initialize(cars)
    @collection = cars.map do |car|
      Car.new id: car["id"],
        price_per_day: car["price_per_day"],
        price_per_km: car["price_per_km"]
    end
  end
end
