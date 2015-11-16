class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @posts = Post.where(:user_id => current_user.id)
    @user = User.friendly.find(params[:id])
    # added for friendly id if name is edited to not break url 
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
    @cities = City.all

    count(@posts, @cities)
  end

  def count(posts, cities)
    @count_sf = 0
    @count_l = 0
    @count_t = 0
    @posts.each do |post|
      if post.city_id == 1
          @count_sf = @count_sf + 1
      elsif post.city_id == 3
          @count_t = @count_t + 1
      else 
          @count_l = @count_l + 1
      end
      @sf = "San Francisco, #{@count_sf} posts"
      @t =  "Tokyo, #{@count_t} posts"
      @l =  "London, #{@count_l} posts"
    end
    @contributors = @sf, @t, @l
  end 

  def create
    #redirect user if already logged in 
    # if current_user
    #   redirect_to user_path
    # else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        
        redirect_to user, flash: { success: "Successfully signed up!" }
      else
        render root_path, flash: { error: "Sign up failed" }

      end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # find user
    user = User.find(params[:id])
    # update user attributes with new form data
    user.update_attributes(user_params)
    redirect_to user
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :current_city, :email, :password, :password_confirmation, :profile_pic)
  end
  

end
