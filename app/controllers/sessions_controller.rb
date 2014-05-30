class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      flash[:success] = 'You have successfully logged-in.'
      login(@user)
      redirect_to root_url
    else
      flash.now[:error] = 'Your username/password is incorrect.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You have logged-out'
  end
end
