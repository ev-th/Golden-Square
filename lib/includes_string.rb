def includes_string?(text)
  if !text.is_a?(String)
    type = text.nil? ? "nil" : text.class
    fail "Invalid argument - expected String and got #{type}" if !text.is_a?(String)
  end
  
  text.include?("#TODO")
end
