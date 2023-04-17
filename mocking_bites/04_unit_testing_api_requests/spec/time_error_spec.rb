require 'time_error'

RSpec.describe TimeError do
  it "returns the difference in seconds between server time and current time" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get)
    .with(URI("https://worldtimeapi.org/api/ip"))
    .and_return("{\"utc_datetime\":\"2023-04-17T20:35:50.495375+00:00\"}")

    fake_time = double :Time
    time_object = Time.new(2023, 4, 17, 21, 35, 0)
    allow(fake_time).to receive(:now).and_return(time_object)

    time_error = TimeError.new(requester=fake_requester)
    result = time_error.error(time=fake_time)
    expect(result).to eq 50.495375
  end
end