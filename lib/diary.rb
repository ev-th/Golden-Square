def make_snippet(str)
  words = str.split(" ")
  first_five_words = words.slice(0, 5).join(" ")
  words.length <= 5 ? first_five_words : first_five_words + "..."
end

def count_words(str)
  words = str.split(" ")
  words.length
end
