require 'collection'
require 'rental'

class RentalCollection
  include Collection

  def initialize(rentals)
    @collection = rentals.map do |rental|
      Rental.new symbolize_keys(rental)
    end
  end
end
