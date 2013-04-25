class UsersController < ApplicationController
	before_filter :authenticate_user!,	only: :show
	before_filter :authenticate_admin!, only: [:index,:destroy]

  def show
    @user = User.find(params[:id])
    @start = current_user?(@user) ? "Your": "#{@user.name}'s"
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy 
    flash[:success] = "User removed!"
    redirect_to users_url(page: params[:page])  		
  end

end
