class EndUserController < ApplicationController

  before_action :authenticate_user!, :authorized_end_user!

  def authorized_end_user!
    unless current_user.is_end_user?
      flash[:error] = 'You are not authorized to access this page'
      respond_to do |format|
        format.html do
          redirect_to '/'
        end
      end
    end
  end


end
