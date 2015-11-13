class CitiesController < ApplicationController
  def show
  	# find user so logged in
  	@user = current_user
  	# find posts for the city
  	@posts = Post.where(:city => "San Francisco")
  end
end
