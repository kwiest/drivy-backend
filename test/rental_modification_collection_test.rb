require 'minitest/autorun'
require 'rental_modification_collection'

class RentalModificationCollectionTest < MiniTest::Test
  def setup
    # rental_data = [
    #   { id: 1, car_id: 1, start_date: "2015-12-08", end_date: "2015-12-08", distance: 100 },
    #   { id: 3, car_id: 1, start_date: "2015-07-03", end_date: "2015-07-14", distance: 1000, deductible_reduction: true }
    # ]

    rental_modification_data = [
      { "id" => 1, "rental_id" => 1, "end_date" => "2015-12-10", "distance" => 150 },
      { "id" => 2, "rental_id" => 3, "start_date" => "2015-07-4" }
    ]
    @collection = RentalModificationCollection.new rental_modification_data
  end

  def test_members_are_rental_modifications
    assert_instance_of RentalModification, @collection.first
  end

  def test_find_by_id
    rental_modification = @collection.find_by_id 1
    assert_instance_of RentalModification, rental_modification
    assert_equal 1, rental_modification.id
  end
end
