class UsersController < ApplicationController

  include Users

  def new
    @user = User.new
    @user.build_personal_detail
    @user.education_details.build
    @user.professional_details.build
  end

  def create
    @role = Role.end_user
    @user = @role.users.new(user_params)
    if @user.save
      flash[:notice] = 'Your Account Is Created Successfully'
      redirect_to new_user_session_path
    else
      render 'new'
    end
  end


end
