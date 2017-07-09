module Collection
  include Enumerable
  attr_accessor :collection

  def each(&block)
    collection.each { |item| block.call item }
  end

  def find_by_id(id)
    collection.select { |item| item.id == id }.first
  end
end
