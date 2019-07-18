class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by email: params[:password_reset][:email]
    if @user
      @user.create_reset_digest
      send_password_reset_email @user
      flash[:success] = t ".success"
      redirect_to root_url
    else
      flash.now[:danger] = t ".error"
      render "new"
    end
  end

  def edit
    if @user && @user.authenticated?(params[:id])
      render "edit"
    else
      flash.now[:danger] = t ".out_of_date"
      render "new"
    end
  end

  def update
    if @user.update_attributes(password: params[:password_reset][:password],
        password_confirmation: params[:password_reset][:password_confirm])
      @user.update_attribute :reset_digest, nil
      flash[:success] = t ".success"
      redirect_to login_path
    else
      flash.now[:danger] = t ".error_confirm"
      render "new"
    end
  end

  private
    def get_user
      @user = User.find_by email: params[:email]
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = t ".error_expiration"
        redirect_to new_password_reset_path
      end
    end

    def send_password_reset_email user
    UserMailer.password_reset(user).deliver_now
  end
end
