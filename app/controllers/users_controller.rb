class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      flash[:notice] = 'Successful registration'
      redirect_back fallback_location: hello_path
    else
      flash[:notice] = @user.errors.messages
      flash[:errors] = @user.errors
      redirect_back fallback_location: hello_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Successful update'
      redirect_back fallback_location: hello_path
    else
      flash[:notice] = 'Could not update profile'
      redirect_back fallback_location: hello_path
    end
  end

  def forgotten
  end

  def send_forgotten
  end

  private
  def user_params
    params.require(:user).permit([:name, :email, :passsword, :password_confirmation, :account])
  end
end
