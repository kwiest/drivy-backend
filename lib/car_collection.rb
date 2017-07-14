require 'collection'
require 'car'

class CarCollection < Collection
  self.collection_class = Car
end
