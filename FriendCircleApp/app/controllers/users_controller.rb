class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(params[:user])
    @user.reset_session_token

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = "Invalid username or password."
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    render :show
  end
end
