class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = "There was an error with your credentials"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you have successfuly logged out"
    redirect_to login_path
  
end