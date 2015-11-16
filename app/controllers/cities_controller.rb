class CitiesController < ApplicationController
  def show
  	# find user so logged in
  	@user = current_user
  	#find city by id
  	@city = City.find(params[:id]) 
  	@posts = Post.where(:city_id => @city).paginate(page: params[:page], per_page: 10).order('created_at DESC')
  	
  end
end
