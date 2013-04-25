class UsersController < ApplicationController
	before_filter :authenticate_user!,	only: :show
	before_filter :authenticate_admin!, only: [:index,:destroy]

  def show
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
