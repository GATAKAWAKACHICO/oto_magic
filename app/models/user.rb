class User < ActiveRecord::Base
	validates :facebook_id,
		:presence => true,
		:uniqueness => true
	validates :facebook_name,
		:presence => true
end
