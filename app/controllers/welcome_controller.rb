class WelcomeController < ApplicationController
  def index
  	if current_user
  		@user = User.find(current_user)
  	else
  		@user = nil
  	end
  end
end
