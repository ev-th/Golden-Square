require 'string_repeater'

RSpec.describe StringRepeater do
  it "uses user input to print out a user string" do
    fake_io = double :io
    expect(fake_io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(fake_io).to receive(:puts).with("Please enter a string")
    expect(fake_io).to receive(:gets).and_return("TWIX")
    expect(fake_io).to receive(:puts).with("Please enter a number of repeats")
    expect(fake_io).to receive(:gets).and_return("10")
    expect(fake_io).to receive(:puts).with("Here is your result:")
    expect(fake_io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")

    string_repeater = StringRepeater.new(fake_io)
    string_repeater.run
  end
end