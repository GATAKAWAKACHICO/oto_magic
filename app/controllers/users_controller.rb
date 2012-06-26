class UsersController < ApplicationController
	def login
		if request.request_parameters[:user][:facebook_id].blank?
			render :json => {"status" => "error"}
		else
			if User.where('facebook_id = ?', request.request_parameters[:user][:facebook_id]).exists?
				render :json => {"status"=>"ok"}
			else
				@user = User.new(request.request_parameters[:user])
				if !@user.save
					render :json => {"status"=>"error"}
				else
					render :json => {"status"=>"ok"}
				end
			end
		end	
	end

	def djdata
		if params[:facebook_id].blank?
			render :json => {status:error}
		else
			if User.where('facebook_id = ?', params[:facebook_id]).select('facebook_id').exists?
				render :json => {"status"=>"regist"}  
			else
				render :json => {"status"=>"notregist"}
			end
		end
	end
    
    def user_data
        if params[:facebook_id].blank?
		    render :json => {status:error}
		else
            res = User.where({ :facebook_id => params[:facebook_id] }).all
            render :json => res
        end
    end
end
