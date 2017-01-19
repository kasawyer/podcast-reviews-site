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
end
