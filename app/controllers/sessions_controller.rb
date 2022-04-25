class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user] = @user.id
      redirect_back fallback_location: hello_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_back fallback_location: hello_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Logged out successfully"
    redirect_back fallback_location: hello_path
  end
end
