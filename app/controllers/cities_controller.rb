class CitiesController < ApplicationController
  def show
  	# find user so logged in
  	@user = current_user
  	#find city by id
  	@city = City.find(params[:id]) 
  	@posts = Post.where(:city_id => @city)
  end
end
