class VowelRemover
  def initialize(text)
    @text = text
    @vowels = ["a", "e", "i", "o", "u"]
  end

  def remove_vowels()
    letters = @text.chars
    letters.reject { |letter| @vowels.include? letter }.join("")
  end
end