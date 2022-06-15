class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'success'
      log_in user
      redirect_to dash_boards_user_path(user.id)
    else
      flash.now[:danger] = 'failed to log in'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'Log out'
    redirect_to login_path
  end
end
