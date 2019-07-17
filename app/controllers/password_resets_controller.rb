class PasswordResetsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by email: params[:password_reset][:email]
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t ".info_reset"
      redirect_to root_path
    else
      flash.now[:danger] = t ".error_reset"
      render "new"
    end
  end
end
