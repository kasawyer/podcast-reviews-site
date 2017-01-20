class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helpers do
    def current_user
      if @current_user.nil? && session[:user_id]
        @current_user = User.find_by(id: session[:user_id])
        session[:user_id] = nil unless @current_user
      end
      @current_user
    end
  end
      
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :remember_me,
        :avatar,
        :avatar_cache
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :current_password,
        :avatar,
        :avatar_cache
      )
    end
