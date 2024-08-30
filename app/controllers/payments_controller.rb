# class PaymentsController < ApplicationController
#   def new
#   end

#   def create
#   end
# end


class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @stripe_publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
  end

  def create
    # Create a Stripe customer and charge
    customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken]
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: params[:amount], # Amount in cents
      description: 'Rails Stripe Customer',
      currency: 'usd'
    })

    flash[:notice] = "Payment successful!"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_payment_path
  end
end

