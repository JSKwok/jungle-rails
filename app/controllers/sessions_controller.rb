class SessionsController < ApplicationController
  def new
  end

  def create
    # Checks for user based on email parameter
    user = User.find_by_email(params[:email])
    # If user exists & password matches, set a cookie to the user.id
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
