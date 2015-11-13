class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    user_id = @post.user_id
    creator = User.find(user_id)
    @user = creator.username
  end

  def update
  end

  def destroy
  end
end
