class OtpController < ApplicationController
  def new
  end

  def create
    @phone_number = params[:phone_number]
    @otp = rand(1000..9999).to_s

    session[:otp] = @otp
    session[:phone_number] = @phone_number

    TwilioService.new.send_otp(@phone_number, @otp)

    redirect_to verify_otp_path
  end

  def verify
  end

  def check
    input_otp = params[:otp]

    if TwilioService.new.verify_otp(input_otp, session[:otp])
      flash[:notice] = "Phone number verified successfully"
      redirect_to root_path
    else
      flash[:alert] = "Invalid OTP, please try again"
      render :verify
    end
  end
end






# class OtpController < ApplicationController
#   def new
#   end

#   def create
#   end

#   def verify
#   end
# end
