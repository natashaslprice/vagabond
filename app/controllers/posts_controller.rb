class PostsController < ApplicationController
  # before_action :require_login
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
    @post = Post.new(post_params)
    #if post saved 
    if @post.save
      #push post into user
      @user.posts << @post
        # find city from post params and use that to find city by id
        if @post.city == "San Francisco"
          city = City.find_by(id: 1)
        elsif @post.city == "London"
          city = City.find_by(id: 2)
        else
          city = City.find_by(id: 3)
        end
      # Push post into city
      city.posts << @post 
      #redirect back to profile page
      redirect_to @user
    else
      # show errors
      @posts_error = flash[:error] = @post.errors.full_messages.join(', ')
      #if not saved return to new post form
      render :new
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
    @user = current_user
  end

  def show
    # find current user so page is logged in
    @user = current_user
    # find post 
    @post = Post.friendly.find(params[:id])
    # added for friendly id if name is edited to not break url 
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
    # find author of post
    user_id = @post.user_id
    @author = User.find(user_id)
    # find city for url
    @city = @post.city.gsub(" ", "-").downcase
    # city without downcase
    @city_name = @post.city
  end

  def update
    # find post
    @post = Post.friendly.find(params[:id])
    # update post attributes with new form data
    @post.update_attributes(post_params) 
    # find city from post params and use that to find city by id
    if @post.city == "San Francisco"
      city = City.find_by(id: 1)
    elsif @post.city == "London"
      city = City.find_by(id: 2)
    else
      city = City.find_by(id: 3)
    end
    # Push post into city
    city.posts << @post 
    # if error
    if @post.errors.any?
      # show errors
      @post_edit_error = flash[:error] = @post.errors.full_messages.join(', ')
      render :edit
    else
      redirect_to @post
    end
  end


  def destroy
    # find current user
    @user = current_user
    # find post to delete
    post = Post.friendly.find(params[:id])
    # destroy post
    post.destroy
    redirect_to @user
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :city)
  end
end
