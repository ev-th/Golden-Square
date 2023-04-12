class GrammarStats
  def initialize
    @passed = 0
    @failed = 0
  end

  def check(text)
    fail "Wrong type argument provided. Should be String." unless text.is_a?(String)

    if text != text.capitalize || !['.', '!', '?'].include?(text[-1])
      @failed += 1
      return false
    end
    
    @passed += 1
    true
  end

  def percentage_good
    fail "There have not been any checks yet." if @passed == 0 && @failed == 0
    total = @passed + @failed
    (@passed * 100 / total.to_f).ceil
  end
end