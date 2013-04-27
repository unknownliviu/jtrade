class UsersController < ApplicationController
	before_filter :correct_auth,	except: :destroy
	before_filter :authenticate_admin!, only: [:destroy]

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

private

  def correct_auth
    authenticate_user! unless (current_user || current_admin)
  end

end
