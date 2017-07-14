require 'minitest/autorun'
require 'rental_collection'

class RentalCollectionTest < MiniTest::Test
  def setup
    data = [
      { "id" => 1, "car_id" => 1, "start_date" => "2017-12-08", "end_date" => "2017-12-10", "distance" => 100 },
      { "id" => 2, "car_id" => 1, "start_date" => "2017-12-14", "end_date" => "2017-12-18", "distance" => 550 }
    ]
    @collection = RentalCollection.new data
  end

  def test_members_are_rentals
    assert_instance_of Rental, @collection.first
  end

  def test_find_by_id
    rental = @collection.find_by_id 1
    assert_instance_of Rental, rental
    assert_equal 1, rental.id
  end
end
