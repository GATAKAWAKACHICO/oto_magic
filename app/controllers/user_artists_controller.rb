class UserArtistsController < ApplicationController
	def regist
		if params[:artists_data].blank?
			render :json => {"status" => "error"}
		else
			UserArtist.transaction do
				@userdata = User.where('facebook_id = ?', params[:artists_data][:facebook_id]).select('facebook_id, facebook_name').first
				raise "error" if @userdata.blank?

				if UserArtist.where('facebook_id = ?', @userdata.facebook_id).exists?
					raise "error" unless UserArtist.destroy_all(:facebook_id => @userdata.facebook_id)
				end

				@artists = params[:artists_data][:artists]
				@artists.each do |artist|
					@userartist = UserArtist.new()
					@userartist.facebook_id = @userdata.facebook_id
					@userartist.facebook_name = @userdata.facebook_name
					@userartist.artist_name = artist
					raise "error" if !@userartist.save
				end
			end
			render :json => {"status" => "ok"}
		end
		rescue => e
			render :json => {"status" => "error"}
	end

	def like
		if params[:users].blank?
			render :json => {"status" => "error"}
		else
			@organizer = params[:users][:organizer]
			organizer_data = UserArtist.where('facebook_id = ?', @organizer).select('facebook_id, facebook_name, artist_name')
			likes = []
			likes.push(organizer_data)
			if likes.blank?
				render :json => {"status" => "error"}
			else
				if params[:users][:ids].blank?
					@participants = ""
				else
					@participants = params[:users][:ids]
				end
				# change limit which equals to capacity setting
				limit = 4
				if @participants.length >= limit
					render :json => {"status" => "over", "max" => limit }	 
				elsif @participants.blank?
					render :json => {"status" => "ok", "data" => likes}
				else
					@participants.each do |participant|
						participants_data = UserArtist.where('facebook_id = ?', participant).select('facebook_id, facebook_name, artist_name')
						if participants_data.blank?
						else
							likes.push(participants_data)
						end
					end
					render :json => {"status" => "ok", "data" => likes}
				end
			end
		end
	end
end
