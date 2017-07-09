require 'minitest/autorun'
require 'rental'

class RentalTest < MiniTest::Test
  def test_time
    rental = Rental.new id: 1, car_id: 1, start_date: "2017-12-8", end_date: "2017-12-10", distance: 100
    assert_equal 3, rental.time
  end
end
