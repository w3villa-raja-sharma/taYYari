class TwilioService
    def initialize
      @client = Twilio::REST::Client.new
    end
  
    def send_otp(phone_number, otp)
      message = @client.messages.create(
        body: "Your verification code is #{otp}",
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: phone_number
      )
      message.sid
    end
  
    def verify_otp(input_otp, stored_otp)
      input_otp == stored_otp
    end
  end
  