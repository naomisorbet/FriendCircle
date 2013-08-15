class PostsController < ApplicationController

  def new
    @friend_circles = FriendCircle.all
    render :new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = params[:user_id]
    if @post.save
      redirect_to user_post_url(current_user, @post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

end
