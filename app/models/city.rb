class City < ActiveRecord::Base
	has_many :posts

	# pagination
	self.per_page = 4

	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

end
