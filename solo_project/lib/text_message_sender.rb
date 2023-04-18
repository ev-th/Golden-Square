class TextMessageSender
  def initialize(order, requester, text_message_api)
    # order is an instance of Order
      # fails if not marked as complete
    # requester expected to use NET::HTTP or fake for unit tests
    # text_message_api expected to be twilio or fake for unit tests
  end

  def send
    # Sends the message
    # Returns json??
  end
end