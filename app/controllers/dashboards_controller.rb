class DashboardsController < ApplicationController

  def index
    if current_user.is_admin?
      redirect_to admin_users_path
    elsif current_user.is_end_user?
      redirect_to end_users_user_path(current_user)
    end
  end

end
