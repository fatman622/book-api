class ApplicationController < ActionController::API
  private
	def _current_profile
		@current_profile = current_user.profile
	end
end
