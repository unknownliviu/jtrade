class ProfilesController < ApplicationController
	before_filter :authenticate_user!
  def edit
  end
end
