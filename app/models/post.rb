class Post < ActiveRecord::Base
	belongs_to :user

	# validate post title exists, between 1 and 200 characters
	validates :title, 
		presence: true,
		length: { maximum: 200 }

	# validates post content exists
	validates :content, presence: true
end
