require 'set'

class Deduper
  def self.dedup(array)
    set = Set.new
    dedup_array = []
    old_set_size = 0

    array.each do |item|
      set.add item.downcase.strip
      if set.size > old_set_size
        dedup_array << item
        old_set_size = set.size
      end
    end

    dedup_array
  end
end