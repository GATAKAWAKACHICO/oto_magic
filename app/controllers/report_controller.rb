class ReportController < ApplicationController
	def index

	end

	def submit
		@posts = Report.new(params[:posts])
		if @posts[:url].blank? || @posts[:name].blank?
			@msg = 'Sorry, Something goes wrong. Please try once again.'
		else
			@posts[:url] = params[:posts][:url]
			@posts[:name] = params[:posts][:name]
			if @posts.save
				@msg = 'Thank you for your report.'
			else
				@msg = 'Sorry, Something goes wrong. Please try once again.'
			end
		end
	end
end
