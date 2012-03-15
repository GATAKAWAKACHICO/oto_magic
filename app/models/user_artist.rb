class UserArtist < ActiveRecord::Base
	validates :facebook_id,
		:presence => true
	validates :facebook_name,
		:presence => true
	validates :artist_name,
		:presence => true
end
