class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		@user = User.new
	end

	def create
	end

	def update
		@user = User.find(params[:id])
  		@user.update(user_params)
 		redirect_to user_path(@user.id)
	end

	def show
		@user = User.find(params[:id])
		@post_images = @user.post_images.page(params[:page]).reverse_order
	end

	def edit
		@user = User.find(params[:id])
	end

	private
	def user_params
  	params.require(:user).permit(:name, :profile_image)
	end

end
