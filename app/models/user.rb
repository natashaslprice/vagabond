class User < ActiveRecord::Base
	#allowing users to have posts
	has_many :posts
	# allow easy authentication
	has_secure_password
	
end
