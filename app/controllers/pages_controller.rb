class PagesController < ApplicationController
  def contact_us
  end

  def new
  end

  def create
    # Logic to handle the form submission
    # For example, sending an email or storing the data in a database
    flash[:notice] = "Thank you for your message. We'll get back to you soon!"
    redirect_to contact_path
  end

  def contact_us
    # This will render the contact form
  end

  def submit_contact
    # Handle form submission logic here
    # For example, save the data or send an email

    flash[:notice] = "Thank you for your message. We will get back to you soon!"
    redirect_to contact_us_path
  end
end
