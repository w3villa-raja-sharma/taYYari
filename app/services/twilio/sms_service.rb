Twilio::SmsService.new(body:'Greetings from W3villa Tech', to_phone_number:'9198915068')

module twilio
    class SmsService
        TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
        TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
        TWILIO_FROM_PHONE = ENV['TWILIO_FROM_PHONE']
        # TWILIO_TEST_PHONE = '9198915068'

        def initialize(body:, to_phone_number:)
            @body = body
            @to_phone_number = to_phone_number
        end

        def call
            @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID,TWILIO_AUTH_TOKEN )
            message = @client.messages
            .create(
                body:@body,
                from:' TWILIO_FROM_PHONE',
                to: to(@to_phone_number)
            )
            puts message.sid
        end


    private

    def to(to_phone_number)
      return TWILIO_TEST_PHONE if Rails.env.development?

      to_phone_number
    end
    

    end
end