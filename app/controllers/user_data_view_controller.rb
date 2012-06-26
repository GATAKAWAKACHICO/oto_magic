class UserDataViewController < ApplicationController
  before_filter :auth
  def index
  	@total_user = User.count
	@male_user = User.where(:facebook_gender => 'male').count
	@female_user = User.where(:facebook_gender => 'female').count
  end

  def auth
    authenticate_or_request_with_http_basic do |user, pass|
    user == 'BstnHouse' && pass == 'takaken0409'
	end
  end
end
