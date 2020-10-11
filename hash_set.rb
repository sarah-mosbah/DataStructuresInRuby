

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @store.length==count 
   if !include?(key) 
   self[key] << key
   @count+=1
   end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return unless include?(key)
    self[key].delete(key)
    @count-=1
  end

  private

  def [](num)
   hashed_key=num.hash
   @store[hashed_key % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store= @store
    @count=0
    @store= Array.new(num_buckets * 2) {Array.new}
    old_store.flatten.each {|num| insert(num)}
  end
end
