require 'date'
require 'json'
require 'net/http'

class TimeError
  def initialize(requester=Net::HTTP)
    @requester = requester
  end

  def error(time=Time)
    return (get_server_time - time.now)
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

te = TimeError.new
p te.error