class PostsController < ApplicationController
  def index
  end

  def new
    # find current user
    @user = current_user
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
        # find city from post params and use that to find city by id
        if post.city == "San Francisco"
          city = City.find_by(id: 1)
        elsif post.city == "London"
          city = City.find_by(id: 2)
        else
          city = City.find_by(id: 3)
        end
      # Push post into city
      city.posts << post 
      #redirect back to profile page
      redirect_to @user
    else
      # show errors
      flash[:error] = post.errors.full_messages.join(', ')
      #if not saved return to new post form
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    # find current user so page is logged in
    @user = current_user
    # find post 
    @post = Post.find(params[:id])
    # find author of post
    user_id = @post.user_id
    @author = User.find(user_id)

  end

  def update
    # find post
    post = Post.find(params[:id])
    # update post attributes with new form data
    post.update_attributes(post_params) 
    # find city from post params and use that to find city by id
    if post.city == "San Francisco"
      city = City.find_by(id: 1)
    elsif post.city == "London"
      city = City.find_by(id: 2)
    else
      city = City.find_by(id: 3)
    end
    # Push post into city
    city.posts << post 
    # show errors
    flash[:error] = post.errors.full_messages.join(', ')
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
