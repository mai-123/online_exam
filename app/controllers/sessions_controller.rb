class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:session][:email]
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      remember @user if params[:session][:remember_me]
      flash[:success] = t ".success_login"
      redirect_to root_url
    else
      flash.now[:danger] = t ".error_login"
      render "new"
    end
  end
end
