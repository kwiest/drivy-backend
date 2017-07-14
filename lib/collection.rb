class Collection
  include Enumerable
  attr_accessor :collection

  class << self
    attr_accessor :collection_class
  end

  def initialize(data)
    @collection = data.map do |item|
      self.class.collection_class.new symbolize_keys(item)
    end
  end

  def each(&block)
    collection.each { |item| block.call item }
  end

  def find_by_id(id)
    collection.select { |item| item.id == id }.first
  end


  private

  def symbolize_keys(hash)
    hash.each_with_object({}) do |(k,v),new_hash|
      new_hash[k.to_sym] = v
    end
  end
end
