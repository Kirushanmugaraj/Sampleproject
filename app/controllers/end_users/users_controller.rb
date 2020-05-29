module EndUsers

  class UsersController < EndUserController

    include ::Users

    before_action :find_user

    def edit
      render 'users/edit'
    end

    def update
      if @user.update(user_params)
        flash[:notice] = 'Details Updated Successfully'
        redirect_to end_users_user_path(@user)
      else
        render 'users/edit'
      end
    end

    private

    def find_user
      @user = current_user
    end

  end

end
