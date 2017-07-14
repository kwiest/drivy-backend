require 'minitest/autorun'
require 'rental'

class RentalTest < MiniTest::Test
  def setup
    @rental = Rental.new id: 1, car_id: 1, start_date: "2017-12-8",
      end_date: "2017-12-10", distance: 100
  end

  def test_bad_dates
    assert_raises Rental::DateError do
      Rental.new id: 1, car_id: 1, start_date: "2017-12-08",
        end_date: "2017-11-08", distance: 100
    end
  end

  def test_time
    assert_equal 3, @rental.time
  end

  def test_to_h
    hash = {
      id: 1, car_id: 1, start_date: "2017-12-08", end_date: "2017-12-10",
      distance: 100, options: { deductible_reduction: false }
    }
    assert_equal hash, @rental.to_h
  end
end
