class AdminController < ApplicationController

  before_action :authenticate_user!, :authorized_admin_user!

  def authorized_admin_user!
    unless current_user.is_admin?
      flash[:error] = 'You are not authorized to access this page'
      respond_to do |format|
        format.html do
          redirect_to '/'
        end
      end
    end
  end

end
