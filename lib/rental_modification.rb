class RentalModification
  attr_accessor :id, :rental_id, :new_attrs, :modified

  def initialize(id:, rental_id:, **args)
    @id = id
    @rental_id = rental_id
    @new_attrs = args
  end

  def build_modified(rental)
    modified_attrs = rental.to_h.merge new_attrs
    options = modified_attrs.delete :options
    options.each { |k,v| modified_attrs[k] = v }

    @modified = Rental.new modified_attrs
    @modified
  end
end
