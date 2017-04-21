module Api
	module V1
		class ApplicationController < ActionController::API
			include ActionController::MimeResponds
			
			private
			def _current_profile
				@current_profile = current_user.profile
			end
		end
	end
end