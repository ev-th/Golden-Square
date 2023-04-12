def calculate_read_time(text)
  if !text.is_a?(String)
    fail "invalid input - not a string"
  end

  if text.empty?
    return 0
  end
  words = text.split(" ")
  (words.length.to_f / 200).ceil
end