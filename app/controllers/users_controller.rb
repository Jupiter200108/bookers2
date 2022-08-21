class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path
  end
  def show
    @user =  User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user =  User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path 
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image ,:introduction)
  end
end