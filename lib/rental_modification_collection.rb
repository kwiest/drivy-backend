require 'collection'
require 'rental_modification'

class RentalModificationCollection < Collection
  self.collection_class = RentalModification
end
