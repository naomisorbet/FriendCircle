require 'bcrypt'

class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user && @user.password == params[:user][:password]
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = "Incorrect username or password."
      render :new
    end
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
