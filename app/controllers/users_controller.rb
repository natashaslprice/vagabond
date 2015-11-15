class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @posts = Post.where(:user_id => current_user.id)
    @user = User.find(params[:id])

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
