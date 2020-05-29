class Admin::UsersController < AdminController

  before_action :find_user, only: [:education_details, :professional_details, :show]

  PER_PAGE = 25

  def index
    @users = User.includes(
      :role,
      :education_details,
      :personal_detail,
      :professional_details,
    ).end_users
    if params[:is_advanced_search].present?
      @users = @users.advance_search(advance_search_params)
    end
    respond_to do |format|
      format.html do
        @users = @users.paginate(page: params[:page], per_page: PER_PAGE)
      end
    end
  end

  def show
  end

  def education_details
    @education_details = @user.education_details
    render_modal('education_details')
  end

  def professional_details
    @education_details = @user.professional_details
    render_modal('professional_details')
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = 'User Deleted Successfully!!'
      redirect_to admin_users_path
    else
      flash[:notice] = 'User Deletion Failed!!'
      redirect_to admin_users_path
    end
  end

  private

  def find_user
    @user = User.includes(:professional_details, :role, :education_details).end_users.find_by(id: params[:user_id])
  end

  def advance_search_params
    params.permit(
      [
        :college_name,
        :degree
      ]
    )
  end

end
