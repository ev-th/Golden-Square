require 'twilio-ruby'

class TextMessageSender
  def initialize(
      order,
      text_message_api=Twilio::REST::Client
    )
    @text_message_api = text_message_api
    @sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @phone_from = ENV['PHONE_NUMBER_FROM']
    @phone_to = ENV['PHONE_NUMBER_TO']
    @order = order  # order is an instance of Order
  end

  def send
    fail "The order must be confirmed before the text message can be sent" unless @order.complete?

    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"

    client = @text_message_api.new(@sid, @auth_token)
    client.messages.create(
      from: @phone_from,
      to: @phone_to,
      body: message
    )
  end

  private

  def delivery_time
    delivery = @order.order_time + 3600
    delivery.strftime("%k:%M")
  end
end