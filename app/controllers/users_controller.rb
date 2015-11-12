class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    #redirect user if already logged in 
    if current_user
      redirect_to profile_path
    else
      user = User.create(user_params)
      if user.save
        session[:user_id] = user.id
        flash[:notice] = "Succesful Signup!"

        redirect_to profile_path
      else
        flash[:error] = user.errors.full_messages.join(', ')

        redirect_to signup_path
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  

end
