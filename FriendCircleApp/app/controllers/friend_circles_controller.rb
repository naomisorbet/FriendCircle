class FriendCirclesController < ApplicationController

  def new
    @users = User.all
    render :new
  end

  def create
    @friend_circle = FriendCircle.new(params[:friend_circle])
    @friend_circle.user_id = params[:user_id]

    if @friend_circle.save
      redirect_to user_friend_circle_url(current_user, @friend_circle)
    else
      render :new
    end
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
    render :show
  end

  def index
    render :index
  end
end
