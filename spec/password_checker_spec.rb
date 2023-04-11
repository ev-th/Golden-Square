require 'password_checker'

describe PasswordChecker do
  it "check method returns true for passwords greater than 8 characters long" do
    password_checker = PasswordChecker.new
    result = password_checker.check('abcdefghi')
    expect(result).to eq true
  end

  it "check method returns true for passwords equal to 8 characters long" do
    password_checker = PasswordChecker.new
    result = password_checker.check('abcdefgh')
    expect(result).to eq true
  end
  
  it "check method raises error for passwords less than 8 characters long" do
    password_checker = PasswordChecker.new
    expect { password_checker.check('abcdefg') }.to raise_error "Invalid password, must be 8+ characters."
  end
end
