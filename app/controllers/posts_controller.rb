class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    # find current user
    @user = current_user
    #make a new post
    post = Post.new(post_params)
    #if post saved 
    if post.save
      #push post into user
      @user.posts << post
      #redirect back to profile page
      redirect_to @user
    else
      #if not saved return to new post form
      redirect_to new_post_path
      #include flash message

    end
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

  private

  def post_params
    params.require(:post).permit(:title, :content, :city)
  end
end
