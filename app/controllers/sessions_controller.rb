class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = 'Logged in'
      redirect_to root_url
    else
      flash.now[:danger] = 'email or password is uncorrect'
      render 'new'
    end
  end
end
