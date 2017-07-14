require 'minitest/autorun'
require 'rental_modification'

class RentalModificationTest < MiniTest::Test
  def setup
    @rental = Rental.new id: 1, car_id: 1, start_date: "2015-12-8",
      end_date: "2015-12-8", distance: 100, deductible_reduction: true
    @modification = RentalModification.new id: 1, rental_id: @rental.id,
      end_date: "2015-12-10", distance: 150
  end

  def test_build_modified_from
    new_rental = @modification.build_modified(@rental)
    assert_equal @rental.start_date, new_rental.start_date
    refute_equal @rental.end_date, new_rental.end_date
    refute_equal @rental.distance, new_rental.distance
  end

  def test_build_modified_with_updated_options
    options = { deductible_reduction: false }
    @rental.options = options
    new_rental = @modification.build_modified @rental
    assert_equal options, new_rental.options
  end
end
