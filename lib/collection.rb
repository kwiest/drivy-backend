module Collection
  include Enumerable
  attr_accessor :collection

  def each(&block)
    collection.each { |item| block.call item }
  end

  def find_by_id(id)
    collection.select { |item| item.id == id }.first
  end


  private

  def symbolize_keys(hash)
    hash.inject({}) do |new_hash,(k,v)|
      new_hash[k.to_sym] = v
      new_hash
    end
  end
end
