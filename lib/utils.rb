module Utils
  def hash_mapper(initial_hash, map)
    map.each_with_object({}) do |(key, value), mapped_hash|
      mapped_hash[key] = initial_hash[value]
    end
  end
end
