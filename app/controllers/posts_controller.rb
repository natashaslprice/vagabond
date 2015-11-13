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
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    user_id = @post.user_id
    @creator = User.find(user_id)

  end

  def update
       # find post
    post = Post.find(params[:id])
    # update post attributes with new form data
    post.update_attributes(post_params)
    redirect_to post
  end

  def destroy
    # find current user
    @user = current_user
    # find post to delete
    post = Post.find(params[:id])
    # destroy post
    post.destroy
    redirect_to @user
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :city)
  end
end
