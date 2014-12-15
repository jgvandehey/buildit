class UsersController < ApplicationController
	def show
		# @user = User.find(params[:id])
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
		@features = @user.features
	end

	protected

	def load_user  
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
	end
end