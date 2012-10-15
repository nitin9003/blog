class ApplicationController < ActionController::Base
  protect_from_forgery


  def confirm_login
    unless session[:admin_id]
      flash[:notice] = "Please Login"
      redirect_to sign_in_admins_path
    end
  end
  
  def admin
    @admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
  end
end
