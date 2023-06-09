require 'text_message_sender'

RSpec.describe TextMessageSender do
  it "sends a message" do
    fake_order = double :order, complete?: true, order_time: Time.new(2023, 2, 2, 19, 30, 0)
    
    expected_delivery_time = Time.new(2023, 2, 2, 20, 30, 0)


    fake_json_response = '{"body": "Hi there", "direction": "outbound-api", "error_code": null, "error_message": null, "from": "+15017122661", "num_media": "0", "num_segments": "1", "price": null, "price_unit": null, "status": "sent", "to": "+15558675310",}'

    fake_messages = double :messages
    allow(fake_messages).to receive(:create).with(
      from: ENV['PHONE_NUMBER_FROM'],
      to: ENV['PHONE_NUMBER_TO'],
      body: "Thank you! Your order was placed and will be delivered before 20:30"
    ).and_return(fake_json_response)

    fake_client = double :client, messages: fake_messages

    fake_api = double :text_message_api
    allow(fake_api).to receive(:new).with(
      ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    ).and_return(fake_client)

    messager = TextMessageSender.new(fake_order, text_message_client=fake_api)
    response = messager.send

    expect(messager.send).to eq fake_json_response
  end

  context "when order is not complete" do
    it "fails to send the message" do
      fake_order = double :fake_order, complete?: false
      text_message_sender = TextMessageSender.new(fake_order)
      expect { text_message_sender.send }.to raise_error (
        "The order must be confirmed before the text message can be sent"
      )
    end
  end
end