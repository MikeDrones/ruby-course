class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "good job you remembered your login info"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login u suck"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You Have Logged Out"
    redirect_to root_path
  end
  
end