# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController


    def omniauth
      auth = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        u.email = auth['info']['email']
        u.name = auth['info']['name']
        u.image = auth['info']['image']
      end
  
      if user.persisted?  
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Signed in successfully'
      else
        redirect_to root_path, alert: 'Something went wrong'
      end
    end

  


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  def afer_sign_out_path_for(_resource_or_scope)
    new_user_Session_path
  end

  def afer_sign_out_path_for(_resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
