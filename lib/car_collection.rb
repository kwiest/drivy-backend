require 'collection'
require 'car'
require 'byebug'

class CarCollection
  include Collection

  def initialize(cars)
    @collection = cars.map do |car|
      Car.new symbolize_keys(car)
    end
  end
end
