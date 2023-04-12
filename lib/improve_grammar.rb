$punctuation = [
  "!", 
  "?", 
  "."
]

def check_grammar(sentence)
  if  !sentence.is_a?(String) || sentence.empty?
    fail "not a valid string"
  end

  first_char = sentence[0]
  last_char = sentence[-1]
  middle_chars = sentence[1..-1]

  if first_char == first_char.downcase || !$punctuation.include?(last_char) || middle_chars != middle_chars.downcase
    return false
  end

  true
end
