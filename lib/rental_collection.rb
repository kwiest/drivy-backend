require 'collection'
require 'rental'

class RentalCollection
  include Collection

  def initialize(rentals)
    @collection = rentals.map do |rental|
      Rental.new id: rental["id"],
        car_id: rental["car_id"],
        start_date: rental["start_date"],
        end_date: rental["end_date"],
        distance: rental["distance"]
    end
  end
end
