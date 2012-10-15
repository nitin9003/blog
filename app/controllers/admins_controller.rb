class AdminsController < ApplicationController

  before_filter :confirm_login, :except => [:create, :sign_in, :destroy]

 layout 'admin'

  def sign_in
  
    # sign_in form
  end



  def create
    admin = Admin.authenticate(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      session[:email] = admin.email
      redirect_to posts_path, :notice => "Logged In Successfully"
    else
      flash.now.alert = "Invalid email/password combination"
      redirect_to sign_in_admin_path
    end
  end

  def destroy
    session[:admin_id] = nil
    session[:email] = nil
    flash[:notice] = "Logged Out"
    redirect_to sign_in_admins_path
  end


end
