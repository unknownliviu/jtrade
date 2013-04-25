class UsersController < ApplicationController
	before_filter :authenticate_user!

  def show
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

end
