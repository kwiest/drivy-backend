require 'collection'
require 'rental'

class RentalCollection < Collection
  self.collection_class = Rental
end
