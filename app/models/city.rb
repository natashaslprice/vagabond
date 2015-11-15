class City < ActiveRecord::Base
	has_many :posts

	# pagination
	self.per_page = 10
end
