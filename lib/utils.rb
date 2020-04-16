module Utils
  def map_hash(initial_hash, fields_map)
    fields_map.transform_values do |source_field|
      initial_hash[source_field]
    end
  end
end
