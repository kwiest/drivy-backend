require 'minitest/autorun'
require 'car_collection'

class CarCollectionTest < MiniTest::Test
  def setup
    data = [
      { "id" => 1, "price_per_day" => 100, "price_per_km" => 10 },
      { "id" => 2, "price_per_day" => 120, "price_per_km" => 20 }
    ]
    @collection = CarCollection.new data
  end

  def test_members_are_cars
    assert_instance_of Car, @collection.first
  end

  def test_find_by_id
    car = @collection.find_by_id 1
    assert_instance_of Car, car
    assert_equal 1, car.id
  end
end
