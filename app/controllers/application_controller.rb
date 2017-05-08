class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def auth_a_user!
    if user_signed_in?
      authenticate_user!
    else
      authenticate_admin!
    end
  end
end
