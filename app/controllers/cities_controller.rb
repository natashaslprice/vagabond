class CitiesController < ApplicationController
  def show
  	# find user so logged in
  	@user = current_user
  	#find city by id
  	@city = City.friendly.find(params[:id])
  	# added for friendly id if name is edited to not break url 
  	if request.path != city_path(@city)
  		redirect_to @city, status: :moved_permanently
  	end
  	@posts = Post.where(:city_id => @city).paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end
end
